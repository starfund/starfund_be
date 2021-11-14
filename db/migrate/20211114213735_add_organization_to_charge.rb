class AddOrganizationToCharge < ActiveRecord::Migration[6.0]
  def change
    add_reference :charges, :organization, null: true, foreign_key: true
    change_column_null :charges, :fighter_id, true
  end
end
