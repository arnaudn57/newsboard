class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update

    @user = User.find(params[:id])

    # ? ----------------------------CATEGORY-------------------
    selected_categories = params[:user][:user_category_ids].reject(&:empty?)
    current_categories = @user.user_categories.map {|uc| uc.category}

    # Ajouter les categories manquantes
    selected_categories.each do |selected_category|
      UserCategory.create(category: selected_category, user: @user) unless current_categories.include?(selected_category)
    end

    # Suppression des categories deselectionnées
    current_categories.each do |current_category|
      UserCategory.find_by(category: current_category, user: @user).destroy unless selected_categories.include?(current_category)
    end

    # ? -------------------------------------------------------------

    # # TODO -----------Carousel Dashboard Index---------------
    # UserCategory.find_by(user_id: @user.id)
    # @user_category = params[:user][:user_category_ids].reject(&:empty?)

    # # TODO -------------Carousel Dashboard Index--------------

    # ! -----------------------MEDIA---------------------
    selected_medias = params[:user][:user_media_type_ids].reject(&:empty?)
    current_medias = @user.user_media_types.map {|uc| uc.media_types}

    # Ajouter les medias manquants
    selected_medias.each do |selected_media|
      UserMediaType.create(media_types: selected_media, user: @user) unless current_medias.include?(selected_media)
    end

    # Suppression des media deselectionnées
    current_medias.each do |current_media|
      UserMediaType.find_by(media_types: current_media, user: @user).destroy unless selected_medias.include?(current_media)
    end
    # user_media_type = UserMediaType.find_or_create_by(user_id: @user.id)
    # user_media_type.update(media_types: params[:user][:user_media_type_ids].reject(&:empty?))
    # ! ---------------------------------------------------------

    @user.update(user_params)
    Dashboard.find_or_create_by(user_id: @user.id)
    redirect_to dashboards_path
  end

  private

  def user_params
    params.require(:user).permit(:available_time)
  end
end
