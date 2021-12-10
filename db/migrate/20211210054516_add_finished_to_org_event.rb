class AddFinishedToOrgEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_events, :finished, :boolean, default: false
  end
end
