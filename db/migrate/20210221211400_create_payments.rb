class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :amount
      t.string :concept
      t.references :user

      t.timestamps
    end
  end
end
