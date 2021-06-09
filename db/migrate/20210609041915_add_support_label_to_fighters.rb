class AddSupportLabelToFighters < ActiveRecord::Migration[6.0]
  def change
    add_column :fighters, :support, :boolean, default: false
  end
end
