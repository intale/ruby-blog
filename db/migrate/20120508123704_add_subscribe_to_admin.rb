class AddSubscribeToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :subscribe, :boolean, :default => false, :null => false
  end
end
