class AddOriginatorToPriceTier < ActiveRecord::Migration[6.0]
  def change
    add_column :price_tiers, :originator, :string
  end
end
