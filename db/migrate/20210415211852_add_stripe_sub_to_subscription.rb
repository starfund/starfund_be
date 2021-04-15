class AddStripeSubToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :stripe_sub, :string
  end
end
