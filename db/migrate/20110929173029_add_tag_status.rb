class AddTagStatus < ActiveRecord::Migration
  def up
    add_column :tags, :status, :boolean, :default => false
  end

  def down
    remove_column :tags, :status
  end
end
