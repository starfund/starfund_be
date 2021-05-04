class AddContentFlagsToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :feed, :boolean, default: true
    add_column :contents, :published, :boolean, default: false
  end
end
