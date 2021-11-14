class ChargeService
  attr_reader :user, :originator, :geo, :stripe_service

  def initialize(user, originator, geo)
    @user = user
    @originator = originator
    @geo = geo
    @stripe_service = StripeService.new(user, geo, originator&.name);
  end

  def process(token_id, price, card_data)
    ActiveRecord::Base.transaction do
      if(!user.card_id || (user&.card_id != token_id))
        stripe_service.add_card(token_id, user.email, user.full_name, card_data) 
      end
      stripe_charge = stripe_service.create_payment(price)
      Charge.create(user: user, fighter: originator, reason: 'ppv', amount: price)
    end
  end

  def ppv(token_id, price, card_data)
    ActiveRecord::Base.transaction do
      if(!user.card_id || (user&.card_id != token_id))
        stripe_service.add_card(token_id, user.email, user.full_name, card_data) 
      end
      stripe_charge = stripe_service.create_payment(price)
      Charge.create(user: user, organization: originator, reason: 'ppv', amount: price)
    end
  end 
end
