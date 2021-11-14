class CreateOrgContent < ActiveRecord::Migration[6.0]
  def change
    create_table :org_contents do |t|
      t.references :org_event, null: false, foreign_key: true
      t.string :title
      t.string :title_ru
      t.string :description
      t.string :description_ru
      t.string :title_es
      t.string :description_es
      t.boolean :public
      t.date :event_date
      t.boolean :published

      t.timestamps
    end
  end
end
