class AddMailchimpSyncToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mailchimp_sync, :boolean, default: false
  end
end
