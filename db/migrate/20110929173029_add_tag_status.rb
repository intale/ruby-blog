class AddTagStatus < ActiveRecord::Migration
  def up
    add_column :tags, :status, :string, :default => "Show"
  end

  def down
    remove_column :tags, :status
  end
end
