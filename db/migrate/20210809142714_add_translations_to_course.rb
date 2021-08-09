class AddTranslationsToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :name_ru, :string
    add_column :courses, :name_es, :string
    add_column :courses, :course_goal_ru, :string
    add_column :courses, :course_goal_es, :string
  end
end
