class AddContentPreviewToFighter < ActiveRecord::Migration[6.0]
  def change
    add_reference :fighters, :content, null: true, foreign_key: true
  end
end
