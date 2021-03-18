require 'stripe'

class StripeService
  class StripeException < StandardError
  end

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def add_card(token_id, email, name)
    create_customer(email, name) unless customer.present?
    card = customer.sources.create(source: token_id)
    ActiveRecord::Base.transaction do
      user.default_card.update(default: false) if user.card_id
      user.credit_cards << CreditCard.create(user: user, card_id: card.id, default: true)
      user.update!(card_id: card.id)
    end
  end

  def credit_card_info
    card = user.card_id
    customer.sources.retrieve(card) if card
  end

  def update_credit_card(card_id, exp_month, exp_year, make_default = false)
    card = Stripe::Customer.update_source(
      user.customer_id,
      card_id,
      { exp_month: exp_month, exp_year: exp_year}
    )
    card_id = card.id
    if make_default
      new_default = CreditCard.find_by(card_id: card_id)
      ActiveRecord::Base.transaction do
        user.default_card.update(default: false)
        user.update(card_id: card_id)
        new_default.update(default: true)
      end
    end
  end

  def create_payment
    Stripe::Charge.create({
      amount: 100,
      currency: 'usd',
      description: 'Example charge',
      customer: user.customer_id,
      source: user.card_id,
    })
  end

  def subscribe(price)
    stripe_price_id = Stripe::Price.list(
                        {currency:'USD', type: 'recurring'}
                      ).select{|p| p.unit_amount_decimal == price}.first.id
    Stripe::Subscription.create({
      customer: user.customer_id,
      items: [
        {price: stripe_price_id},
      ],
    })
  end

  def customer
    customer_id = user.customer_id
    return unless customer_id.present?

    @customer ||= Stripe::Customer.retrieve(customer_id)
  end

  private

  def create_customer(email, name)
    customer_params = {
      email: email,
      description: "Customer - #{name}"
    }
    @customer = Stripe::Customer.create(customer_params)
    user.update!(customer_id: @customer.id)
  end
end
