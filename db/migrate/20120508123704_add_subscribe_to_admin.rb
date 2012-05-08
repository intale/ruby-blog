class AddSubscribeToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :subscribe, :boolean
  end
end
