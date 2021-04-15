class StripeSubscriptionUpdateService
  attr_reader :subscription

  def initialize(subscription)
    @subscription = subscription
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
  end

  def cancel_sub
  end

  def lapse_sub
  end
end
