class AddFieldsToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_reference :organizations, :price_tier, null: false, foreign_key: true, default: 1
  end
end
