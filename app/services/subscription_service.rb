class SubscriptionService
  attr_reader :user, :fighter, :stripe_service

  def initialize(user, fighter)
    @user = user
    @fighter = fighter
    @stripe_service = StripeService.new(user);
  end

  def process(token_id, price, fighter_id)
    ActiveRecord::Base.transaction do
      if(!user.card_id || (user&.card_id != token_id))
        stripe_service.add_card(token_id, user.email, user.full_name) 
      end
      stripe_service.subscribe(price)
      Subscription.create(user: user, fighter: fighter, last_charge: price,
                          last_charge_date: DateTime.now)
    end
  end
end