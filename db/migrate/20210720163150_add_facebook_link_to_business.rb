class AddFacebookLinkToBusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :facebook_link, :string
  end
end
