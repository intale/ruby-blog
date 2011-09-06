namespace :data do
  desc "Create administrator's record. Nick - admin, username - admin, password - admin, email - admin@admin.com. Don't forget to change this!"
  task :admin => :environment do
    puts "Create administrator's record. Nick - admin, username - admin, password - admin, email - admin@admin.com. Don't forget to change this!"
     if admin=Admin.create!(:nick => "admin", :password => "admin", :password_confirmation => "admin", :email => "admin@admin.com", :username => "admin")
       admin.create_avatar
       puts "\n\nDone! Now you can log in with username 'admin' and password 'admin' at /admins/sign_in"
     end
  end
end