class PostStatus < ActiveRecord::Migration
  def up
    add_column :posts, :status, :string
    add_column :posts, :truncate_character, :integer
  end

  def down
    remove_column :posts, :status, :string
    remove_column :posts, :truncate_character, :integer
  end
end
