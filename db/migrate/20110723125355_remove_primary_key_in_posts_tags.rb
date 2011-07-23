class RemovePrimaryKeyInPostsTags < ActiveRecord::Migration
  def change
    remove_column :posts_tags, :id
  end
end
