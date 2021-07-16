class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :country
      t.string :preview_url
      t.references :price_tier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
