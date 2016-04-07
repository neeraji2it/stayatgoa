#set :application, "set your application name here"
#set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
set :stages, %w(production)
set :default_stage, "production"
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

role (:web) {"#{domain}"}
role (:app) {"#{domain}"}
role (:db) { ["#{domain}", {:primary => true}] }

# Set the deploy branch to the current branch
set :application, "livegoa"
set :scm, :git
set (:repository) { "#{gitrepo}" }
set (:deploy_to) { "#{deploydir}" }
set :scm_user, "root"
set :keep_releases, 2
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

desc "Symlinks database.yml, mailer.yml file from shared directory into the latest release"
task :symlink_shared, :roles => [:app, :db] do
  run "ln -s #{shared_path}/config/database.yml #{latest_release}/config/database.yml"
  run "ln -s #{shared_path}/system #{latest_release}/system"
end

after "deploy:update", "deploy:cleanup"
# after "deploy:stop",    "delayed_job:stop"
# after "deploy:start",   "delayed_job:start"
# after "deploy:restart", "delayed_job:restart"
# 

#task :restart_delayed_job, :roles => [:app, :db] do
#  run "RAILS_ENV=serverdev script/delayed_job stop"
#  run "RAILS_ENV=serverdev script/delayed_job start"
#end
#
#after 'deploy:finalize_update', :restart_delayed_job

after 'deploy:finalize_update', :symlink_shared
#after 'deploy:finalize_update', 'deploy:extractions'

namespace :deploy do
  desc "Reload the database with seed data"
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
end
   