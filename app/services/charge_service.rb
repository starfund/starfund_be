class ChargeService
  attr_reader :user, :fighter, :geo, :stripe_service

  def initialize(user, fighter, geo)
    @user = user
    @fighter = fighter
    @geo = geo
    @stripe_service = StripeService.new(user, geo);
  end

  def process(token_id, price)
    ActiveRecord::Base.transaction do
      if(!user.card_id || (user&.card_id != token_id))
        stripe_service.add_card(token_id, user.email, user.full_name) 
      end
      stripe_charge = stripe_service.create_payment(price)
      # Create Charge for ppv
    end
  end
end
