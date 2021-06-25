class CreateBusiness < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :country
      t.date :birthdate
      t.string :category
      t.references :price_tier, null: false, foreign_key: true
      t.references :content, null: true, foreign_key: true
    end
  end
end
