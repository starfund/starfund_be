class CreateCourse < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :level
      t.string :course_goal
      t.integer :course_type
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
