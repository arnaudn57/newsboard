# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts "Delete all"
Article.destroy_all
Dashboard.destroy_all
User.destroy_all

puts "Creating Users..."

User.create!(email: "romain.jumeau@hotmail.fr", username: "Romain", password: "secret", available_time: 10)
User.create!(email: "felix.dubois@hotmail.fr", username: "Felix", password: "secret", available_time: 45)
User.create!(email: "arnaud.nicastro@sfr.fr", username: "Arnaud", password: "secret", available_time: 20)

puts "Creating Articles..."

# Article.create!(title: "Le monde va mal", content: "Bonjour, c'est Jean-Pierre Pernault, c'est la crise dans le monde, bisous", category: "General", publish_date: "22/11/2021", source: "Le Monde")
# Article.create!(title: "Les pauvres sont pauvres", content: "Bonjour, c'est Jean-Pierre Pernault, les pauvres sont pauvres, bisous", category: "Economy", publish_date: "22/11/2021", source: "Les Echos")
# Article.create!(title: "Les gens sont malades", content: "Bonjour, c'est Jean-Pierre Pernault, les gens sont malades, bisous", category: "Santé", publish_date: "22/11/2021", source: "Le Figaro")
# Article.create!(title: "Le sport c'est cool", content: "Bonjour, c'est Jean-Pierre Pernault, le sport c'est cool, bisous", category: "Sport", publish_date: "22/11/2021", source: "L'Equipe")
# Article.create!(title: "La tech ça tue", content: "Bonjour, c'est Jean-Pierre Pernault, la tech ça tue, bisous", category: "Tech", publish_date: "22/11/2021", source: "Les Numériques")
# Article.create!(title: "Le monde va mal", content: "Bonjour, c'est Jean-Pierre Pernault, c'est la crise dans le monde, bisous", category: "General", publish_date: "22/11/2021", source: "Le Monde")
# Article.create!(title: "Les pauvres sont pauvres", content: "Bonjour, c'est Jean-Pierre Pernault, les pauvres sont pauvres, bisous", category: "Economy", publish_date: "22/11/2021", source: "Les Echos")
# Article.create!(title: "Les gens sont malades", content: "Bonjour, c'est Jean-Pierre Pernault, les gens sont malades, bisous", category: "Santé", publish_date: "22/11/2021", source: "Le Figaro")
# Article.create!(title: "Le sport c'est cool", content: "Bonjour, c'est Jean-Pierre Pernault, le sport c'est cool, bisous", category: "Sport", publish_date: "22/11/2021", source: "L'Equipe")
# Article.create!(title: "La tech ça tue", content: "Bonjour, c'est Jean-Pierre Pernault, la tech ça tue, bisous", category: "Tech", publish_date: "22/11/2021", source: "Les Numériques")

# Dashboard.create!(time_reading: 15, date: "22/11/2021", user_id: 1)
# Dashboard.create!(time_reading: 40, date: "22/11/2021", user_id: 2)
# Dashboard.create!(time_reading: 25, date: "22/11/2021", user_id: 3)

# UserCategory.create!(category: 'Sport', user_id: 1)
# UserCategory.create!(category: 'General', user_id: 1)
# UserCategory.create!(category: 'Sport', user_id: 2)
# UserCategory.create!(category: 'Economie', user_id: 2)
# UserCategory.create!(category: 'Sante', user_id: 3)
# UserCategory.create!(category: 'Tech', user_id: 3)


puts "Finished !"
