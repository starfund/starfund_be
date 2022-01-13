class AddTimestampsToCharge < ActiveRecord::Migration[6.0]
  def change
    add_column :charges, :created_at, :datetime
    add_column :charges, :updated_at, :datetime
  end
end
