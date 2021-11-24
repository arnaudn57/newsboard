class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])

    user_category = UserCategory.find_or_create_by(user_id: @user.id)
    user_category.update(category: params[:user][:user_category_ids].reject(&:empty?))
    user_media_type = UserMediaType.find_or_create_by(user_id: @user.id)
    user_media_type.update(media_types: params[:user][:user_media_type_ids].reject(&:empty?))
    @user.update(user_params)

  end

  private

  def user_params
    params.require(:user).permit(:available_time)
  end
end
