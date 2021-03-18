class SubscriptionService
  attr_reader :user, :stripe_service

  def initialize(user, fighter)
    @user = user
    @fighter = fighter
    @stripe_service = StripeService.new(user);
  end

  def process(price, card, fighter_id)
    ActiveRecord::Base.transaction do
      stripe_service.add_card(card, user.email, user.name) if user.card_id != card
      stripe_service.subscribe(price)
      Subscription.create(user: user, fighter: fighter, last_charge: price,
                          last_charge_date: DateTime.now)
    end
  end
end
