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



  #---------Méthode de création de dashboard récupérant les méthodes d'insertions---------

  def self.create_all_users_new_dashboards
    self.find_each do |user|
      new_dashboard = Dashboard.create(user: user, date: Date.today)
      all_user_media_types = user.user_media_types.map(&:media_types)
      user.insert_articles_into_dashboards(new_dashboard) if all_user_media_types.include?("Articles")
      user.insert_podcast_into_dashboards(new_dashboard) if all_user_media_types.include?("Podcast")
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

#----------Méthode d'update de dashboard pour un user quand il édit ou quand il crée son premier dashboard----------
  def update_user_dashboard
    new_dashboard = Dashboard.create(user_id: self.id, date: Date.today)
    all_user_media_types = self.user_media_types.map(&:media_types)
        self.update_user_dashboard_by_articles(new_dashboard) if all_user_media_types.include?("Articles")
        self.insert_podcast_into_dashboards(new_dashboard) if all_user_media_types.include?("Podcast")
  end

  def update_user_dashboard_by_articles(dashboard)
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
