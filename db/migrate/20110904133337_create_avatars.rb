class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.string :entity_type
      t.integer :entity_id
      t.timestamps
    end
  end
end
