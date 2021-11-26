require 'json'
require 'open-uri'
require 'net/http'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_media_types
  has_many :user_categories
  has_many :dashboards


  def self.create_all_users_new_dashboards
    self.find_each do |user|
      new_dashboard = Dashboard.create(user: user, date: Date.today)
      all_user_categories = user.user_categories.map do |user_categorie|
        user_categorie.category
      end
      all_user_categories.each do |category|

        # api
        url = "https://api.newscatcherapi.com/v2/search?q=#{category}&lang=fr"
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        request = Net::HTTP::Get.new(uri.request_uri)
        request['x-api-key'] = ENV["NEWSBOARD_API_KEY"]
        http.use_ssl = true
        response = http.request(request)
        hash = JSON.parse response.body.gsub('=>', ':')
        article= hash["articles"].first
            article = Article.create!(title: article["title"], content: article["excerpt"], category: category, source: article["clean_url"], url: article["link"], image: article["media"])
            Medium.create!(dashboard: new_dashboard, mediable: article)
            sleep(1) # car 1 requete api /s max
        end
      end
    end
end
