server '192.168.137.75', :web, :app, :db, primary: true

set :deploy_to, '/home/admin/production/ruby_blog'
 
set :rails_env, 'production'
set :user, 'admin'
 
set :unicorn_conf, "#{deploy_to}/current/config/unicorn_pre.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"
 
set :shared_path, "#{deploy_to}/shared"

#set :branch, 'master'
set :branch, 'master'

set :user, 'admin'
