class AddPriceTierToFighter < ActiveRecord::Migration[6.0]
  def change
    PriceTier.find_or_create_by(level: 1)
    add_reference :fighters, :price_tier, null: false, foreign_key: true, default: 1
  end
end
