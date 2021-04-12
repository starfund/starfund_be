class AddPrivacyToContent < ActiveRecord::Migration[6.0]
  def change
    add_column :contents, :public, :boolean, default: true
  end
end
