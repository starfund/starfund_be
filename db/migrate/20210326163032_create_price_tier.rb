class CreatePriceTier < ActiveRecord::Migration[6.0]
  def change
    create_table :price_tiers do |t|
      t.integer :us
      t.integer :ru
      t.integer :level

      t.timestamps
    end
  end
end
