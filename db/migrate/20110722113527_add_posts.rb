class AddPosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :admin_id
      t.text :subject
      t.text :message
    end
  end
end
