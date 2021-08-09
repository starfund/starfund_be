class AddSloganTransToBusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :slogan_es, :string
    add_column :businesses, :slogan_ru, :string
  end
end
