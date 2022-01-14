class ChargeService
  attr_reader :user, :originator, :geo, :stripe_service, :referal_code

  def initialize(user, originator, referal_code, geo)
    @user = user
    @originator = originator
    @geo = geo
    @referal_code = referal_code
    @stripe_service = StripeService.new(user, geo);
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
      Charge.create(user: user, org_event: originator, reason: 'ppv', amount: price, referal_code: referal_code)
    end
  end 
end
