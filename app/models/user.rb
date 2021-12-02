require 'json'
require 'open-uri'
require 'net/http'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :favoris, dependent: :destroy
  has_many :user_media_types, dependent: :destroy
  has_many :user_categories, dependent: :destroy
  has_many :dashboards, dependent: :destroy
  has_many :favori_media, through: :favoris, source: :medium
  validates :available_time, presence: true, on: :update

  #---------Méthode de création de dashboard récupérant les méthodes d'insertions---------

  def self.create_all_users_new_dashboards
    self.find_each do |user|
      new_dashboard = Dashboard.create(user: user, date: Date.today)
      all_user_media_types = user.user_media_types.map(&:media_types)
      user.insert_articles_into_dashboards(new_dashboard) if all_user_media_types.include?("Articles")
      user.insert_podcast_into_dashboards(new_dashboard) if all_user_media_types.include?("Podcasts")
      user.insert_video_into_dashboards(new_dashboard) if all_user_media_types.include?("Video")
    end
  end

  #------Méthodes d'insertion d'articles / podcasts / vidéos dans les dashboards des users-------

  def insert_articles_into_dashboards(dashboard)
    all_user_categories = self.user_categories.map(&:category)
    all_user_categories.each do |category|
      if (10..20).include?(self.available_time)
        articles = Article.where(category: category).last(1)
      elsif (20..30).include?(self.available_time)
        articles = Article.where(category: category).last(2)
      elsif (30..45).include?(self.available_time)
        articles = Article.where(category: category).last(3)
      end
      articles.each do |article|
        Medium.create!(dashboard: dashboard, mediable: article)
      end
    end
  end

  def insert_podcast_into_dashboards(dashboard)
    podcast = Podcast.last
    Medium.create!(dashboard: dashboard, mediable: podcast)
  end

  def insert_video_into_dashboards(dashboard)
    video = Video.last
    Medium.create!(dashboard: dashboard, mediable: video)
  end

  #----------Méthode d'update de dashboard pour un user quand il édit ou quand il crée son premier dashboard----------

  def create_dashboard_by_articles(dashboard)
    all_user_categories = UserCategory.where(user: self).map do |user_categorie|
      user_categorie.category
    end
    all_user_categories.each do |category|
      if (10..20).include?(self.available_time)
        articles = Article.where(category: category).last(1)
      elsif (20..30).include?(self.available_time)
        articles = Article.where(category: category).last(2)
      elsif (30..45).include?(self.available_time)
        articles = Article.where(category: category).last(3)
      end
      articles.each do |article|
        Medium.create!(dashboard: dashboard, mediable: article)
      end
    end
  end
end
