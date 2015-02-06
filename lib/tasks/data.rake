namespace :data do
  desc "Create administrator's record. Nick - admin, username - admin, password - admin, email - admin@admin.com. Don't forget to change this!"
  task :admin => :environment do
    puts "Create administrator's record. Nick - admin, username - admin, password - admin, email - admin@admin.com. Don't forget to change this!"
     if Admin.create!(:nick => "admin", :password => "123456", :password_confirmation => "123456", :email => "admin@admin.com", :username => "admin")
       puts "\n\nDone! Now you can log in with username 'admin' and password 'admin' at /admins/sign_in"
     end
  end

  desc "Check content on out links and adding rel tag for it"
  task :correct_out_links => :environment do
    require 'nokogiri'

    Post.all.each do |post|
      html = Nokogiri::HTML(post.message)
      html.xpath("//a").each { |link|  link['rel'] = 'nofollow' }
      post.update_attribute(:message, html.to_html)
    end
  end
end
