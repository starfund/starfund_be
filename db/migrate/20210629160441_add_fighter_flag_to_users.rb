class AddFighterFlagToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_fighter, :boolean, default: false, null: false
  end
end
