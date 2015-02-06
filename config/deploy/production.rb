server '192.168.137.75', :web, :app, :db, primary: true

set :deploy_to, '/home/admin/production/ruby_blog'
 
set :rails_env, 'production'
set :user, 'admin'
 
set :unicorn_conf, "#{deploy_to}/current/config/unicorn_pre.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"
 
set :shared_path, "#{deploy_to}/shared"

set :branch, 'master'


namespace :deploy do
  task :start do
        run "cd #{current_path} && bundle exec unicorn -c #{fetch(:unicorn_conf)} -E #{fetch(:rails_env)} -D"
  end

  task :stop do
    run "kill -s TERM `cat #{fetch(:unicorn_pid)}` || true"
  end

  task :restart do #Silence restart
      run "kill -s USR2 `cat #{fetch(:unicorn_pid)}` || true"
  end

  task :full_restart do
    invoke 'deploy:stop'
    invoke 'deploy:start'
  end
end