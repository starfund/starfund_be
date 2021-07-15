class AddTeamToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_reference :subscriptions, :team, null: true, foreign_key: true
  end
end
