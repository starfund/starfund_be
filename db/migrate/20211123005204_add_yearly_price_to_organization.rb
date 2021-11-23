class AddYearlyPriceToOrganization < ActiveRecord::Migration[6.0]
  def change
    add_column :organizations, :yearly_discount, :integer
  end
end
