class AddSloganToBusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :slogan, :string
  end
end
