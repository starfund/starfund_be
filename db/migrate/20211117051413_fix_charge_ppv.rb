class FixChargePpv < ActiveRecord::Migration[6.0]
  def change
    remove_column :charges, :organization_id
    add_reference :charges, :org_events, null: true, foreign_key: true
  end
end
