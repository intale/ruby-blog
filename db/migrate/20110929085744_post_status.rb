class PostStatus < ActiveRecord::Migration
  def up
    add_column :posts, :status, :boolean, :default => true
    add_column :posts, :truncate_character, :integer, :default => 100
  end

  def down
    remove_column :posts, :status
    remove_column :posts, :truncate_character
  end
end
