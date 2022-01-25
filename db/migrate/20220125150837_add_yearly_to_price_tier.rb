class AddYearlyToPriceTier < ActiveRecord::Migration[6.0]
  def change
    add_column :price_tiers, :stripe_id_annual, :string
    add_column :price_tiers, :us_annual, :integer
  end
end
