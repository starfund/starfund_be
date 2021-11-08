class CreateOrgEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :org_events do |t|
      t.string :name
      t.references :organization, null: false, foreign_key: true
      t.string :description
      t.date :event_date
    end
  end
end
