class CreateSimpleCaptchaData < ActiveRecord::Migration
  def change
    create_table :simple_captcha_data do |t|
      t.string :key, :limit => 40
      t.string :value
      t.timestamps
    end
    
    add_index :simple_captcha_data, :key, :name => "idx_key"
  end
end
