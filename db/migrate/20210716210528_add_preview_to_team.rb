class AddPreviewToTeam < ActiveRecord::Migration[6.0]
  def change
    add_reference :teams, :content, null: true, foreign_key: true
  end
end
