module Webhooks
  class InvalidStripeWebhookRequest < ::StandardError; end
  class DuplicateStripeEvent < ::StandardError; end

  class StripeSubscriptionsController < ActionController::API
    before_action :verify_webhooks_enabled

    def update
      payload = request.body.read
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']

      begin
        event = validate_and_construct_event(payload, sig_header)
        handler = "handle_#{event.type.tr('.', '_')}".to_sym

        if respond_to?(handler, true)
          send(handler, event)
          mark_as_handled(sig_header, event)
        end

        head :ok
      rescue JSON::ParserError,
             Stripe::SignatureVerificationError,
             InvalidStripeWebhookRequest => e
        # log_and_track_exception(e)
        return render body: nil, status: 400
      rescue DuplicateStripeEvent
        head :ok
      rescue StandardError => e
        # log_and_track_exception(e)
        return render body: nil, status: 500
      end
    end

    def handle_invoice_voided(event)
      invoice = event.data.object
      # order_fulfillment = OrderFulfillment.find_by!(payment_provider_invoice_id: invoice.id)
      # BulkOrderProcessor.new(order_fulfillment.order_id, invoice).void_invoice!
    end

    def handle_customer_subscription_updated(event)
      #StripeSubscriptionUpdateService.new(event.data.object).update_subscription
    end

    def handle_customer_subscription_deleted(event)
      #StripeSubscriptionUpdateService.new(event.data.object).update_subscription
    end

    def handle_invoice_payment_succeeded(event)
      invoice = event.data.object
      if invoice.subscription.present?
        stripe_sub = Stripe::Subscription.retrieve(invoice.subscription)
        if !stripe_sub.blank? && stripe_sub.status == 'active'
          fighter = stripe_sub.fighter
          StripeSubscriptionUpdateService.new(stripe_sub).update_subscription
        end
      end
    end

    private

    def verify_webhooks_enabled
      head :ok
    end

    def redis
      @redis_ns ||= Redis::Namespace.new("stripe-wh-events", redis: init_redis)
    end

    def init_redis
      ConnectionPool::Wrapper.new(size: configatron.connection_pool.redis.size,
                                  timeout: configatron.connection_pool.redis.timeout) do
        options = { url: ENV[ENV['REDIS'].to_s] || "redis://localhost:6379" }
        options[:logger] = Logger.new(Rails.root.join('log', 'redis.log')) if Rails.env.development?
        Redis.new(options)
      end
    end

    def validate_and_construct_event(payload, sig_header)
      timestamp = /t=(\d*)/.match(sig_header)[1]
      raise InvalidStripeWebhookRequest if (Time.now - Time.at(timestamp.to_i)) > 5.minutes
      raise InvalidStripeWebhookRequest unless Rails.cache.fetch(sig_header).nil?

      event = Stripe::Webhook.construct_event(payload, sig_header, ENV['STRIPE_WEBHOOK_SECRET'])

      # TODO: proceed only if event id does not exist in redis
      raise DuplicateStripeEvent if redis.exists(event.id)

      event
    end

    def mark_as_handled(sig_header, event)
      Rails.cache.write(sig_header, "true", expires_in: 5.minutes)

      redis.set(event.id, true)
      redis.expire(event.id, 2.days.to_i)
    end
  end
end