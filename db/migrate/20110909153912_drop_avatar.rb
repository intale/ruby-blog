class DropAvatar < ActiveRecord::Migration
  def up
    drop_table :avatars
  end

end
