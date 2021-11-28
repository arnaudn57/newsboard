class DashboardsController < ApplicationController
  def index
    @user = current_user
    @user_categories = @user.user_categories
    categories = @user_categories.map(&:category)

    #Arriver a retrouvé le dernier dashboard du user et le mettre dans @dashboard
    @dashboard = @user.dashboards.order(:created_at).last
    # @dashboards = @user.dashboard.order(:create_at).all

    @articles = @dashboard.articles.select { |article| categories.include?(article.category)}
  end
end
