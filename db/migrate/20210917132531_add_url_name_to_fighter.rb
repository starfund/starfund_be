class AddUrlNameToFighter < ActiveRecord::Migration[6.0]
  def change
    add_column :fighters, :url_name, :string
  end
end
