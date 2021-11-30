class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user

    # ? ----------------------------CATEGORY-------------------
    selected_categories = params[:user][:user_category_ids].reject(&:empty?)
    current_categories = @user.user_categories.map {|uc| uc.category}

    # Ajouter les categories manquantes
    selected_categories.each do |selected_category|
      UserCategory.create(category: selected_category, user: @user) unless current_categories.include?(selected_category)
    end

    # Suppression des categories deselectionnées
    current_categories.each do |current_category|
      UserCategory.find_by(category: current_category, user: @user).destroy! unless selected_categories.include?(current_category)
    end
    # ? -------------------------------------------------------------

    # # TODO -----------Carousel Dashboard Index---------------
    # UserCategory.find_by(user_id: @user.id)
    # @user_category = params[:user][:user_category_ids].reject(&:empty?)

    # # TODO -------------Carousel Dashboard Index--------------

    # ! -----------------------MEDIA---------------------
    selected_medias = params[:user][:user_media_type_ids].reject(&:empty?)
    current_medias = @user.user_media_types.map {|umt| umt.media_types}

    # Ajouter les medias manquants
    selected_medias.each do |selected_media|
      UserMediaType.create(media_types: selected_media, user: @user) unless current_medias.include?(selected_media)
    end

    # Suppression des media deselectionnées
    current_medias.each do |current_media|
      UserMediaType.find_by(media_types: current_media, user: @user).destroy! unless selected_medias.include?(current_media)
    end

    @user.update!(user_params)

    @user.dashboards.last.update!(active: false) unless @user.dashboards.empty?

    new_dashboard = Dashboard.create(user: @user, date: Date.today)
    all_user_media_types = UserMediaType.where(user: @user).map(&:media_types)
    current_user.create_dashboard_by_articles(new_dashboard) if all_user_media_types.include?("Articles")
    current_user.insert_podcast_into_dashboards(new_dashboard) if all_user_media_types.include?("Podcasts")
    redirect_to user_dashboards_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:available_time)
  end
end
