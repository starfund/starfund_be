class AddBusinessToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :business, null: true, foreign_key: true
  end
end
