class CreateOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :region
      t.string :city
      t.string :address
      t.string :zip_code
      t.string :size
      t.integer :amount
      t.references :merch_items, null: false, foreign_key: true
    end
  end
end
