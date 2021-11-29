class FavorisController < ApplicationController
  def index
    @favoris = Favori.where(user: current_user)
  end

  def create
    @favori = Favori.new
    @medium = Medium.find(params[:favori][:medium_id])
    @favori.medium = @medium
    @favori.user = current_user
    @favori.save!
    redirect_to dashboards_path
  end

  private

  # def favori_params
  #   params.require(:favori).permit(:medium)
  # end
end
