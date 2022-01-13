class AddDivisionToOrgContent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_contents, :division, :string
    add_column :org_contents, :rounds, :integer
  end
end
