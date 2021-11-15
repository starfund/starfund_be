class AddFeedToOrgContent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_contents, :feed, :boolean, default: false
  end
end
