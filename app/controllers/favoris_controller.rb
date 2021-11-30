class FavorisController < ApplicationController
  def index
    @user = current_user
    @favoris = Favori.where(user: @user)
  end

  def create
    @user = current_user
    @favori = Favori.new
    @medium = Medium.find(params[:favori][:medium_id])
    @favori.medium = @medium
    @favori.user = @user
    @favori.save!
    redirect_to user_dashboards_path(@user)
  end

  def destroy
    @favori = Favori.find(params[:id])
    @favori.destroy
    redirect_to user_favoris_path(current_user)
  end
end
