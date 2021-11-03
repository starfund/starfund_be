class AddOrganizationToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :organization, null: true, foreign_key: true
  end
end
