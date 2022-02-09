class AddNameAndStripeIdToPriceTier < ActiveRecord::Migration[6.0]
  def change
    add_column :price_tiers, :name, :string
    add_column :price_tiers, :stripe_id, :string
  end
end
