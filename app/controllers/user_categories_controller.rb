class UserCategoriesController < ApplicationController

  def create
    @user_category = User_category.new(user_category)
    @user = User.find(params[:user_id])
    @user_category.user = @user
    @user_category.save
    redirect_to user_path(@user)
  end

  def destroy
    @user_category = User_category.find(params[:id])
    @user_category.destroy
    redirect_to user_path(@user_category.user)
  end


   private

  def user_category_params
    params.require(:user_category).permit(:category)
  end
end
