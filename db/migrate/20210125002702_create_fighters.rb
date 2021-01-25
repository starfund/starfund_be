class CreateFighters < ActiveRecord::Migration[6.0]
  def change
    create_table :fighters do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.float :reach
      t.integer :height
      t.datetime :birthdate
      t.string :organization
    end
  end
end
