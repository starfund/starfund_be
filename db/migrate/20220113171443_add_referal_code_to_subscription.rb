class AddReferalCodeToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :referal_code, :string
  end
end
