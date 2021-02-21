class AddStripeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :card_id, :string
    add_column :users, :customer_id, :string
  end
end
