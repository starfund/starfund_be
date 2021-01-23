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
    user.update!(card_id: card.id)
  end

  def credit_card_info
    card = user.card_id
    customer.sources.retrieve(card) if card
  end

  def update_credit_card(token_id)
    card = customer.sources.create(source: token_id)
    card.save
    card_id = card.id
    customer.default_source = card_id
    customer.save
    user.update!(card_id: card_id)
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
