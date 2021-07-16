class SubscriptionService
  attr_reader :user, :fighter, :stripe_service, :geo, :team

  def initialize(user, fighter, team, geo)
    @user = user
    @fighter = fighter
    @team = team
    @geo = geo
    @stripe_service = StripeService.new(user, geo);
  end

  def process(token_id, price)
    ActiveRecord::Base.transaction do
      if(!user.card_id || (user&.card_id != token_id))
        stripe_service.add_card(token_id, user.email, user.full_name) 
      end
      stripe_sub = stripe_service.subscribe(price)
      if fighter
        return Subscription.create(user: user,
                                   fighter: fighter,
                                   last_charge: price,
                                   last_charge_date: DateTime.now,
                                   stripe_sub: stripe_sub.id)
      end
      if team 
        return Subscription.create(user: user,
                                   team: team,
                                   last_charge: price,
                                   last_charge_date: DateTime.now,
                                   stripe_sub: stripe_sub.id)
      end
    end
  end
end
