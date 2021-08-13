class StripeSubscriptionUpdateService
  attr_reader :subscription, :stripe_sub

  def initialize(stripe_sub, subscription)
    @subscription = subscription
    @stripe_sub = stripe_sub
  end

  def update_subscription
    case subscription.status
    when 'active'
      renew_sub
    when 'inactive'
      cancel_sub
    when 'lapsed'
      lapse_sub
    end
  end

  def renew_sub
    new_start_date = Date.strptime(stripe_sub.current_period_start.to_s, '%s')
    subscription.renew unless subscription.active?
    subscription.update(last_charge_date: new_start_date)
  end

  def cancel_sub
    subscription.cancel!
  end

  def lapse_sub
    # subscription.invalidate!
  end
end
