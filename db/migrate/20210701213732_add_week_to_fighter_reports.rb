class AddWeekToFighterReports < ActiveRecord::Migration[6.0]
  def change
    add_column :fighter_reports, :week, :integer
  end
end
