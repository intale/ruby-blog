task "resque:setup" => :environment
namespace :resque do
  task :setup do
    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'
    require 'resque_scheduler/server'
    require 'resque/tasks'
    require 'resque_scheduler/tasks'
    # you probably already have this somewhere
    Resque.redis = 'localhost:6379'
    Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")

  end
end