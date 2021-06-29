class CreateFighterReport < ActiveRecord::Migration[6.0]
  def change
    create_table :fighter_reports do |t|
      t.integer :year
      t.integer :month
      t.references :user, null: false, foreign_key: true
      t.references :fighter, null: false, foreign_key: true
      t.integer :page_visits
      t.integer :subscriptors
      t.integer :subscribers_per_visitors
      t.integer :monthly_income
      t.integer :cancelations
    end
  end
end
