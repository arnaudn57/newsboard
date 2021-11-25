class DashboardsController < ApplicationController
  def index
#     @user = current_user
#     @dashboard = Dashboard.find_by(user_id: @user.id)
#     @user_categories = @dashboard.user.user_categories
#     @media_categories = []
#     @user_categories.each do |user_categorie|
#       @media_categories << Article.where(category: user_categorie.category)
#     end
#     if (10..20).include?(@user.available_time)
#       @three_articles = @media_categories.each do |media_category|
#         media_category.limit(3)
#         raise
#       end
#       @medias = @three_articles.each do |article|
#         Medium.create(mediable: article)
#       end
#     elsif (20..30).include?(@user.available_time)
#       @six_articles = @media_categories.limit(6)
#       @medias = @six_articles.each do |article|
#         Medium.create(mediable: article)
#       end
#     elsif (30..40).include?(@user.available_time)
#       @nine_articles = @media_categories.limit(9)
#       @medias = @nine_articles.each do |article|
#         Medium.create(mediable: article)
#       end
#     end
  end
end
