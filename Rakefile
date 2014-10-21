# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

task :deploy do
  puts "=> Pushing to Heroku..."
  sh "git push heroku master"
  puts "=> Migrate Heroku Database..."
  sh "heroku run 'rake db:migrate'"
  puts "=> Updating ENV variables..."
  sh "bundle exec figaro heroku:set"
  puts "=> Updating paperclip styles..."
  sh "rake paperclip:refresh:missing_styles"
end

Rails.application.load_tasks
