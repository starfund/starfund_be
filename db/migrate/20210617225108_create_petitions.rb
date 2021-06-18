class CreatePetitions < ActiveRecord::Migration[6.0]
  def change
    create_table :petitions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :topic
      t.string :requester
      t.string :receiver
      t.string :explanation
    end
  end
end
