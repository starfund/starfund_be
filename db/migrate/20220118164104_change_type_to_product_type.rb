class ChangeTypeToProductType < ActiveRecord::Migration[6.0]
  def change
    rename_column :merch_items, :type, :product_type
  end
end
