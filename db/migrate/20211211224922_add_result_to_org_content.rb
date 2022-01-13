class AddResultToOrgContent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_contents, :result_description, :string
  end
end
