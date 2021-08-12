class AddBrandToCreditCard < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_cards, :brand, :string
  end
end
