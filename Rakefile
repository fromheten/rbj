# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

task :deploy do
  exec "git push origin master;"
  exec "git push heroku master;"
  exec "bundle exec figaro heroku:set;"
end

Rails.application.load_tasks
