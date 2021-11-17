class FixChargeColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :charges, :org_events_id
    add_reference :charges, :org_event, null: true, foreign_key: true
  end
end
