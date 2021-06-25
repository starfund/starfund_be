class CreateCourseSchedule < ActiveRecord::Migration[6.0]
  def change
    create_table :course_schedules do |t|
      t.integer :week_day
      t.time :start_hour
      t.time :end_hour
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
