Installation instruction(under linux):

1.Install right ruby version
rvm install ruby-1.9.2-p290
rvm use ruby-1.9.2-p290
rvm gemset create ruby-blog

2.Install PostgreSQL:
sudo apt-get install postgresql pgadmin3
sudo apt-get install libpq-dev libpq5
sudo -u postgres psql postgres
\password postgres
sudo -u postgres createdb mydb

3.Install nokogiri dependencies:
sudo apt-get install libxml2 libxml2-dev libxslt1.1 libxslt1-dev

4.Create database.yml
Just copy database.yml.example and configure your db setup

5.Finishing installation
bundle install
rake db:create
rake db:migrate
rake data:admin


Now go to http://your_host/administration/admins to create new posts/admins etc.

Have fun