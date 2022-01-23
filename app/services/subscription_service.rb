class SubscriptionService
  attr_reader :user, :fighter, :stripe_service, :geo, :team, :business, :organization, :referal_code

  def initialize(user, fighter, team, business, organization, referal_code, geo)
    @user = user
    @fighter = fighter
    @team = team
    @business = business
    @organization = organization
    @geo = geo
    @referal_code = referal_code
    @stripe_service = StripeService.new(user, geo);
  end

  def process(token_id, price, card_data)
    stripe_sub = ''
    ActiveRecord::Base.transaction do
      if(!user.card_id || (user&.card_id != token_id))
        stripe_service.add_card(token_id, user.email, user.full_name, card_data) 
      end
      if already_subscribed?
        raise StandardError.new "Already subscribed"
      end

      stripe_sub = stripe_service.subscribe(price)
      if fighter
        p "SUB_LOGGING: CREATING SUB FOR FIGHTER"
        return Subscription.find_or_create_by(user: user,
                                              fighter: fighter,
                                              last_charge: price,
                                              last_charge_date: DateTime.now,
                                              stripe_sub: stripe_sub.id)
      end
      if team
        p "SUB_LOGGING: CREATING SUB FOR TEAM"
        return Subscription.find_or_create_by(user: user,
                                              team: team,
                                              last_charge: price,
                                              last_charge_date: DateTime.now,
                                              stripe_sub: stripe_sub.id)
      end
      if business
        p "SUB_LOGGING: CREATING SUB FOR BUSINESS"
        return Subscription.find_or_create_by(user: user,
                                              business: business,
                                              last_charge: price,
                                              last_charge_date: DateTime.now,
                                              stripe_sub: stripe_sub.id)
      end
      if organization
        p "SUB_LOGGING: CREATING SUB FOR ORGANIZATION"
        return Subscription.find_or_create_by(user: user,
                                              organization: organization,
                                              referal_code: referal_code,
                                              last_charge: price,
                                              last_charge_date: DateTime.now,
                                              stripe_sub: stripe_sub.id
                                              )
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
    if organization
      return Subscription.exists?(user: user, organization: organization)
    end
  end
end
