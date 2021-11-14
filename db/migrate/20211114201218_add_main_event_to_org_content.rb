class AddMainEventToOrgContent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_contents, :main_event, :boolean, default: false
  end
end
