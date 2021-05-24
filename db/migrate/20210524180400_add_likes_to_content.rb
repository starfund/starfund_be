class AddLikesToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :fake_likes_count, :integer, default: 0
    add_column :contents, :likes_count, :bigint, default: 0
  end
end
