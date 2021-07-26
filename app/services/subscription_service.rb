class SubscriptionService
  attr_reader :user, :fighter, :stripe_service, :geo, :team, :business

  def initialize(user, fighter, team, business, geo)
    @user = user
    @fighter = fighter
    @team = team
    @business = business
    @geo = geo
    @stripe_service = StripeService.new(user, geo);
  end

  def process(token_id, price)
    stripe_sub = ''
    ActiveRecord::Base.transaction do
      if(!user.card_id || (user&.card_id != token_id))
        stripe_service.add_card(token_id, user.email, user.full_name) 
      end
      if (user.customer_id || already_subscribed?)
        raise StandardError.new "Already subscribed"
      end

      stripe_sub = stripe_service.subscribe(price)
      if fighter
        return Subscription.find_or_create_by(user: user,
                                              fighter: fighter,
                                              last_charge: price,
                                              last_charge_date: DateTime.now,
                                              stripe_sub: stripe_sub.id)
      end
      if team 
        return Subscription.find_or_create_by(user: user,
                                              team: team,
                                              last_charge: price,
                                              last_charge_date: DateTime.now,
                                              stripe_sub: stripe_sub.id)
      end
      if business 
        return Subscription.find_or_create_by(user: user,
                                              business: business,
                                              last_charge: price,
                                              last_charge_date: DateTime.now,
                                              stripe_sub: stripe_sub.id)
      end
    end
  end

  def already_subscribed?
    if fighter
      return Subscription.exists?(user: user, fighter: fighter)
    end
    if team
      return Subscription.exists?(user: user, team: team)
    end
    if business
      return Subscription.exists?(user: user, business: business)
    end
  end
end
