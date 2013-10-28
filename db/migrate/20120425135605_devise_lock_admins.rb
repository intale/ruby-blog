class DeviseLockAdmins < ActiveRecord::Migration
  def change
    change_table(:admins) do |t|
      #t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
    end

    #add_index :admins, :unlock_token,         :unique => true

  end
end
