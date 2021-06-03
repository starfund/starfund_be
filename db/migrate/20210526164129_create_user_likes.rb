class CreateUserLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_likes do |t|
      t.references :content, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
