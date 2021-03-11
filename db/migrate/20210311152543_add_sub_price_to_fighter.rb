class AddSubPriceToFighter < ActiveRecord::Migration[6.0]
  def change
    add_column :fighters, :sub_price, :integer
  end
end
