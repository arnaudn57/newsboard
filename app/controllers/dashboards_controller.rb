class DashboardsController < ApplicationController
  def index
    @user = current_user
    @favori = Favori.new
    # @user_categories = @user.user_categories
    # categories = @user_categories.map(&:category)

    #Arriver a retrouvé le dernier dashboard du user et le mettre dans @dashboard
    @dashboards = @user.dashboards.where(active: true).order(:created_at)
    # @dashboards = @user.dashboard.order(:create_at).all

    # @articles = @dashboard.articles.select { |article| categories.include?(article.category)} #Ne sert plus

    # @dashboard.articles = Articles deja trier selon l'utilisateur


    # current_medias = @user.user_media_types.map {|umt| umt.media_types}

    # !-----------------DASHBOARD CAROUSEL----------------------
      # ?-------------CLASS ACTIVE------------------
        # @first_dashboard = @user.dashboards.order(:created_at).last
        # @y = @user.dashboards.last.articles
      # ?-----------END CLASS ACTIVE-------------------------------

      # ?-----------OTHER DASHBOARDS-----------------------------
      #  @u = @user.dashboards.order(:created_at).last(7)
      #  @y = @u.clone
      #  @y.pop
      # ?-----------END OTHERDASHBOARDS-----------------------
    # !------------------END CAROUSEL----------------------------
  end
end
