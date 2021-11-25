class DashboardsController < ApplicationController
  def index
    @user = current_user
    @dashboard = Dashboard.find(@user.id)
    @user_categories = @dashboard.user.user_categories
    # @user_categories.each do |user_categorie|
    #   @user_categorie = user_categorie.category
    # end
    # @media_categories = Article.where(category: @user_categorie)
    if (10..20).include?(@user_time)
      @three_articles = Article.limit(3)
      @medias = @three_articles.each do |article|
        Medium.create(mediable: article)
      end
    elsif (20..30).include?(@user_time)
      @six_articles = Article.limit(6)
      @medias = @six_articles.each do |article|
        Medium.create(mediable: article)
      end
    elsif (30..40).include?(@user_time)
      @nine_articles = Article.limit(9)
      @medias = @nine_articles.each do |article|
        Medium.create(mediable: article)
      end
    end
  end

end
