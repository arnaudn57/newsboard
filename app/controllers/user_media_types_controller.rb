class UserMediaTypesController < ApplicationController
  def create
    @user_media_type = User_media_type.new(user_media_type)
    @user = User.find(params[:user_id])
    @user_media_type.user = @user
    @user_media_type.save
    redirect_to user_path(@user)
  end

  def destroy
    @user_media_type = User_media_type.find(params[:id])
    @user_media_type.destroy
    redirect_to user_path(@user_media_type.user)
  end

   private

  def user_media_type_params
    params.require(:user_media_type).permit(:category)
  end

end
