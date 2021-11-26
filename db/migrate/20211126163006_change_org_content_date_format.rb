class ChangeOrgContentDateFormat < ActiveRecord::Migration[6.0]
  def change
    change_column :org_contents, :event_date, :datetime
  end
end
