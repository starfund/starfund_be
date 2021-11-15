class AddStreamLinkToOrgEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_events, :stream_link, :string
  end
end
