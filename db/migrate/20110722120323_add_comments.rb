class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :admin_id
      t.text :content
      t.timestamps
    end
  end
end
