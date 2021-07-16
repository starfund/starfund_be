class ChangeFighterOptionalSubscriptions < ActiveRecord::Migration[6.0]
  def change
    change_column_null :subscriptions, :fighter_id, true
  end
end
