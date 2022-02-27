class AddReplayToOrgEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :org_events, :replay, :boolean
  end
end
