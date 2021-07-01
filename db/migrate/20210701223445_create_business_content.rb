class CreateBusinessContent < ActiveRecord::Migration[6.0]
  def change
    create_table :business_contents do |t|
      t.references :business, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.date :event_date
      t.boolean :public
      t.boolean :published
      t.string :title_ru
      t.string :description_ru
      t.string :title_es
      t.string :description_es

      t.timestamps
    end
  end
end
