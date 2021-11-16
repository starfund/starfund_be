class ChangeOrgEventDateToDateTime < ActiveRecord::Migration[6.0]
  def change
    change_column :org_events, :event_date, :datetime
    add_column :org_contents, :is_live, :boolean, default: false
  end
end
