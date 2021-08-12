class AddLast4ToCreditCard < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_cards, :last4, :integer
  end
end
