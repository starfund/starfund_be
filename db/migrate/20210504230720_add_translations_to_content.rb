class AddTranslationsToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :title_ru, :string
    add_column :contents, :description_ru, :string
    add_column :contents, :title_es, :string
    add_column :contents, :description_es, :string
  end
end
