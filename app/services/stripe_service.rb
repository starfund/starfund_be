require 'stripe'

class StripeService
  class StripeException < StandardError
  end

  attr_reader :user, :geo

  def initialize(user, geo)
    @user = user
    @geo = geo
  end

  def add_card(token_id, email, name, card_data)
    create_customer(email, name) unless customer.present?
    card = customer.sources.create(source: token_id)
    ActiveRecord::Base.transaction do
      user.default_card.update(default: false) if user.default_card
      user.credit_cards << CreditCard.create(
                            user: user,
                            card_id: card.id,
                            default: true,
                            brand: card_data[:brand],
                            last4: card_data[:last4]
                          )
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

  def create_payment(price)
    Stripe::Charge.create({
      amount: price,
      currency: currency,
      description: 'PPV Charge',
      customer: user.customer_id,
      source: user.card_id,
    })
  end

  def subscribe(price, originator)
    begin
      p "SUBSCRIBING: #{user&.email}"
      p "FINDING PRICE FOR: #{originator} - price: #{price}"
      sys_price = PriceTier.find_by(us: price, originator: originator)
      stripe_price_id = sys_price.stripe_id
      p "SUBSCRIBING - PRICE FOUND FOR STRIPE: #{stripe_price_id}"
      create_customer(user.email, user.first_name) unless user.customer_id
      Stripe::Subscription.create({
        customer: user.customer_id,
        items: [
          {price: stripe_price_id},
        ],
      })
    rescue Exception => ex
      p "ERROR ON STRIPE SUB"
      Raygun.track_exception(ex, {
        custom_data: {
          price: price,
          stripe_price: sys_price,
          user: user.email,
          geo: geo,
          currency: currency
        }
      })
    end
  end

  def customer
    customer_id = user.customer_id
    return unless customer_id.present?

    @customer ||= Stripe::Customer.retrieve(customer_id)
  end

  private

  def currency
    geo == 'ru' ? 'RUR' : 'USD'
  end

  def create_customer(email, name)
    return if customer.present?

    customer_params = {
      email: email,
      description: "Customer - #{name}"
    }
    @customer = Stripe::Customer.create(customer_params)
    user.update!(customer_id: @customer.id)
  end
end
