class FixesComments < ActiveRecord::Migration
  def change
    remove_column :comments, :admin_id
    add_column :comments, :author, :string
  end
end
