class AddSessionLogs < ActiveRecord::Migration
  def change
    create_table :session_logs do |t|
      t.integer :post_id
      t.integer :comment_id
      t.text :session_uid
    end
  end
end
