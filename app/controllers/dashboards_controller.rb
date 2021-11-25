class DashboardsController < ApplicationController
  def index

    @user = current_user
    @dashboard = Dashboard.find_by(user_id: @user.id)
    @user_categories = @dashboard.user.user_categories


    if (10..20).include?(@user.available_time)
      @three_articles = Article.limit(3)
      @medias = @three_articles.each do |article|
        Medium.create(mediable: article)
      end
    elsif (20..30).include?(@user.available_time)
      @six_articles = Article.limit(6)
      @medias = @six_articles.each do |article|
        Medium.create(mediable: article)
      end
    elsif (30..40).include?(@user.available_time)
      @nine_articles = Article.limit(9)
      @medias = @nine_articles.each do |article|
        Medium.create(mediable: article)
      end
    end

    # ---------------Carousel-----------
    # @user_category

  end

end
