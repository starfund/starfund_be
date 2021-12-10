class AddHomePageToOrgEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_events, :home_page, :boolean, default: false
  end
end
