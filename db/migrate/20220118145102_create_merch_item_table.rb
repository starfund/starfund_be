class CreateMerchItemTable < ActiveRecord::Migration[6.0]
  def change
    create_table :merch_items do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.integer :amount_xs
      t.integer :amount_s
      t.integer :amount_m
      t.integer :amount_l
      t.integer :amount_xl
      t.integer :width
      t.integer :length
    end
  end
end
