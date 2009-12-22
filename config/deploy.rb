set :application, 'html2pdf'
set :repository,  'git@github.com:lest/html2pdf.git'

ssh_options[:forward_agent] = true

set :scm, :git
set :branch, 'master'
set :deploy_via, :remote_cache
set :deploy_to, "/home/justlest/#{application}"
set :use_sudo, false
set :user, 'justlest'

role :web, 'justlest.info'                   # Your HTTP server, Apache/etc
role :app, 'justlest.info'                   # This may be the same as your `Web` server
role :db,  'justlest.info', :primary => true # This is where Rails migrations will run

namespace :deploy do
  task :start do
    # nothing
  end
  task :stop do
    # nothing
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after 'deploy:update_code', 'link_production_db'

desc 'Link in the production database.yml'
task :link_production_db do
  run "ln -nfs #{deploy_to}/#{shared_dir}/config/database.yml #{release_path}/config/database.yml"
end

namespace :delayed_job do
  desc 'Start delayed_job process'
  task :start, :roles => :app do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} script/delayed_job start"
  end

  desc 'Stop delayed_job process'
  task :stop, :roles => :app do
    run "cd #{current_path}; RAILS_EVN=#{rails_env} script/delayed_job stop"
  end

  desc 'Restart delayed_job process'
  task :restart, :roles => :app do
    run "cd #{current_path}; script/delayed_job restart #{rails_env}"
  end
end
