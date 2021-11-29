class FavorisController < ApplicationController
  def index
    @favoris = Favori.where(user_id: current_user)
  end

  def create
    @favori = Favori.new
    @medium = Medium.find(params[:favori][:medium_id])
    @favori.medium = @medium
    @favori.user = current_user
    @favori.save!
    redirect_to dashboards_path
  end

  def destroy
    @favori = Favori.find(params[:id])
    @favori.destroy
    redirect_to user_favoris_path(current_user)
  end
end
