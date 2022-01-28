class AddOrdersToCharges < ActiveRecord::Migration[6.0]
  def change
    add_reference :charges, :orders, foreign_key: true
  end
end
