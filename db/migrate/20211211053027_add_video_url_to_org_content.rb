class AddVideoUrlToOrgContent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_contents, :video_url, :string
  end
end
