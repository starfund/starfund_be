class CreateContent < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
      t.references :fighter, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.date :event_date

      t.timestamps
    end
  end
end
