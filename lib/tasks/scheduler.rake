require 'podcast_api'

desc "This task is called by the Heroku scheduler add-on"
task :update_medias => :environment do
  puts "Updating medias..."
  Medium.create_all_new_articles
  Medium.create_new_podcasts
  puts "Finish"
end

task :create_dashboards => :environment do
  puts "Creating dashboards..."
  User.create_all_users_new_dashboards
  puts "Finish"
end
