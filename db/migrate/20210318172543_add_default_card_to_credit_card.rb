class AddDefaultCardToCreditCard < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_cards, :default, :boolean, default: false
  end
end
