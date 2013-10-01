require 'rvm/capistrano' # for rvm
require 'bundler/capistrano' # for bundler. While changing bundler automatically update all the gems on the serer to match all developers gems.
require 'capistrano/ext/multistage'

set :using_rvm,       true

set :application, 'ruby_blog'
set :use_sudo, false
ssh_options[:forward_agent] = true
ssh_options[:auth_methods] = ['publickey']

set :scm, :git # Using git.
set :repository,  'git@github.com:SBS-team/ruby-blog.git' # Path to your repository
set :deploy_via, :remote_cache # Using cache. Deploying only changes.

set :stages,          %w(preproduction production)
set :default_stage,   'preproduction'
set :keep_releases, 3

set :migrate_target, :latest

set (:rvm_ruby_string){"ruby-2.0.0-p247@ruby-blog#{stage}"}

after 'deploy:finalize_update', 'deploy:migrate'
before 'deploy:migrate', 'config:symlink'

before 'deploy:setup', 'rvm:install_ruby'
after 'deploy:setup', 'config:setup_folders'

namespace :config do
  desc 'Symlink configuration files.'
  task :symlink do
    run "ln -nfs #{shared_path}/#{stage}.yml #{release_path}/config/environments/#{stage}.yml"
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/unicorn_pre.rb #{release_path}/config/unicorn_pre.rb"
  end

  task :setup_folders do
    run "touch -m #{shared_path}/#{stage}.yml"
    run "touch -m #{shared_path}/database.yml"
    run "mkdir -p #{shared_path}/uploads"
    run "touch -m #{shared_path}/unicorn_pre.rb"
  end
end

namespace :rails do
  desc 'Open the rails console on one of the remote servers'
  task :console, roles: :app do
    exec "ssh -l #{user} '192.168.137.75' -t 'cd #{current_path} && bundle install && bundle exec rails c #{stage}'"
  end
end

desc 'tail production log files'
task :tail_logs, roles: :app do
  trap('INT') { puts 'Interupted'; exit 0; }
  run "tail -f #{shared_path}/log/#{stage}.log" do |channel, stream, data|
    puts  # for an extra line break before the host name
    puts "#{channel[:host]}: #{data}"
    break if stream == :err
  end
end

after 'deploy', 'deploy:cleanup'