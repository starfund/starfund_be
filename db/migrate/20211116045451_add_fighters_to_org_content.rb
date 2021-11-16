class AddFightersToOrgContent < ActiveRecord::Migration[6.0]
  def change
    add_column :org_contents, :fighter_1, :string
    add_column :org_contents, :fighter_2, :string
    add_column :org_contents, :winner, :string
  end
end
