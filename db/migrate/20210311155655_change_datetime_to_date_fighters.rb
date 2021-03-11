class ChangeDatetimeToDateFighters < ActiveRecord::Migration[6.0]
  def change
    change_column :fighters, :birthdate, :date
  end
end
