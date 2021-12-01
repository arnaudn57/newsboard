require 'podcast_api'
require 'yt'

class Medium < ApplicationRecord
  belongs_to :dashboard
  belongs_to :mediable, polymorphic: true
  has_many :favoris

  has_many :articles, :through => :media, :source_type => "Article"
  has_many :podcasts, :through => :media, :source_type => "Podcasts"
  has_many :videos, :through => :media, :source_type => "Video"

CATEGORIES = ['news', 'sport', 'tech', 'politics', 'business', 'music', 'gaming']

#-----------Méthodes de créations d'articles / podcasts / vidéos en utilisant chaque API-----------

  def self.create_all_new_articles
    all_categories = Medium::CATEGORIES
    all_categories.each do |category|
      # api
      url = "https://api.newscatcherapi.com//v2/latest_headlines?lang=fr&countries=FR&topic=#{category}&when=24h&ranked_only=True&page_size=10"
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      request['x-api-key'] = ENV["NEWSBOARD_API_KEY"]
      http.use_ssl = true
      response = http.request(request)
      hash = JSON.parse response.body.gsub('=>', ':')
      new_articles = hash["articles"]
      new_articles.each do |article|
        Article.create!(title: article["title"], content: article["excerpt"], category: category, source: article["clean_url"], url: article["link"], image: article["media"])
        sleep(1) # car 1 requete api /s max
      end
    end
  end

  def self.create_new_podcasts
    api_key = ENV["LISTEN_API_KEY"]
    client = PodcastApi::Client.new(api_key: api_key)
    response = client.fetch_podcast_by_id(
    id: '465b0837be0f409ab88702f153eaaee1',
    sort: 'recent_first',
    )
    hash = JSON.parse(response.body)
    podcast = hash["episodes"].first
    Podcast.create!(title: podcast["title"], description: podcast["description"], audio: podcast["audio"], image: podcast["image"], url: podcast["link"])
  end

  def self.create_new_videos
    Yt.configuration.api_key = ENV["YOUTUBE_API_KEY"]
    video = Yt::Channel.new id: "UCAcAnMF0OrCtUep3Y4M-ZPw"
    daily_video = video.videos.first
    Video.create!(title: daily_video.title, url: "https://www.youtube.com/embed/#{daily_video.id}")
  end
end


#
