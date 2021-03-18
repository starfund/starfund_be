class AddCardIdToCreditCards < ActiveRecord::Migration[6.0]
  def change
    add_column :credit_cards, :card_id, :string
  end
end
