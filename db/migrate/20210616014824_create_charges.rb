class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fighter, foreign_key: true
      t.string :reason
      t.integer :amount
    end
  end
end
