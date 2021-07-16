class AddTeamToFighter < ActiveRecord::Migration[6.0]
  def change
    add_reference :fighters, :team, null: true, foreign_key: true
  end
end
