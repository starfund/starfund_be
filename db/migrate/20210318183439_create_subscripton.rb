class CreateSubscripton < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptons do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fighter, null: false, foreign_key: true
      t.integer :last_charge
      t.datetime :last_charge_date

      t.timestamps
    end
  end
end
