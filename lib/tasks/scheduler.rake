require 'podcast_api'

desc "This task is called by the Heroku scheduler add-on"
task :update_dashboards => :environment do
  puts "Updating medias..."
  Medium.create_all_new_articles
  puts "Articles ok"
  Medium.create_new_podcasts
  puts "Podcasts ok"
  Medium.create_new_videos
  puts "Video ok"
  puts "Creating dashboards..."
  User.create_all_users_new_dashboards
  puts "Finish"
end
