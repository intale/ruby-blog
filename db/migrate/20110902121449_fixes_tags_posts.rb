class FixesTagsPosts < ActiveRecord::Migration
  def change
    change_column :posts_tags, :post_id, :integer, :null => false
    change_column :posts_tags, :tag_id, :integer, :null => false
    add_index :posts_tags, [:post_id, :tag_id], :unique => true
  end
end
