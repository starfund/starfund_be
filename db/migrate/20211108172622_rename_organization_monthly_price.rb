class RenameOrganizationMonthlyPrice < ActiveRecord::Migration[6.0]
  def change
    rename_column :organizations, :monthly_price, :ppv_price
  end
end
