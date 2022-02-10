class AddOrganizationToMerchItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :merch_items, :organization, foreign_key: true
  end
end
