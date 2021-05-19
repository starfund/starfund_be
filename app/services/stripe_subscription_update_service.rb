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
    ending_date = Date.strptime(stripe_sub.period_end,'%s')
    subscription.renew
    subscription.update(last_charge_date: ending_date)
  end

  def cancel_sub
  end

  def lapse_sub
  end
end
