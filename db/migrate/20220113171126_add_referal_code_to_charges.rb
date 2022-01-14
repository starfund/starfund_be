class AddReferalCodeToCharges < ActiveRecord::Migration[6.0]
  def change
    add_column :charges, :referal_code, :string
  end
end
