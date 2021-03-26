class AddPriceTierToFighter < ActiveRecord::Migration[6.0]
  def change
    add_reference :fighters, :price_tier, null: false, foreign_key: true, default: 1
  end
end
