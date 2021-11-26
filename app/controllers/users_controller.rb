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
      if @user.dashboards.empty?
        new_dashboard = Dashboard.create(user_id: @user.id, date: Date.today)
        all_user_categories = UserCategory.where(user: @user).map do |user_categorie|
          user_categorie.category
        end
        all_user_categories.each do |category|
          # api
          url = "https://api.newscatcherapi.com/v2/search?q=#{category}&lang=fr"
          uri = URI.parse(url)
          http = Net::HTTP.new(uri.host, uri.port)
          request = Net::HTTP::Get.new(uri.request_uri)
          request['x-api-key'] = ENV["NEWSBOARD_API_KEY"]
          http.use_ssl = true
          response = http.request(request)
          hash = JSON.parse response.body.gsub('=>', ':')
          article = hash["articles"].first
              article = Article.create!(title: article["title"], content: article["excerpt"], category: category, source: article["clean_url"], url: article["link"], image: article["media"])
              Medium.create!(dashboard: new_dashboard, mediable: article)
              sleep(1) # car 1 requete api /s max
        end
      else @user.dashboards.last.destroy
        new_dashboard = Dashboard.create(user_id: @user.id, date: Date.today)
        all_user_categories = UserCategory.where(user: @user).map do |user_categorie|
          user_categorie.category
        end
        all_user_categories.each do |category|
          # api
          url = "https://api.newscatcherapi.com/v2/search?q=#{category}&lang=fr"
          uri = URI.parse(url)
          http = Net::HTTP.new(uri.host, uri.port)
          request = Net::HTTP::Get.new(uri.request_uri)
          request['x-api-key'] = ENV["NEWSBOARD_API_KEY"]
          http.use_ssl = true
          response = http.request(request)
          hash = JSON.parse response.body.gsub('=>', ':')
          article = hash["articles"].first
              article = Article.create!(title: article["title"], content: article["excerpt"], category: category, source: article["clean_url"], url: article["link"], image: article["media"])
              Medium.create!(dashboard: new_dashboard, mediable: article)
              sleep(1) # car 1 requete api /s max
        end
      end
        redirect_to dashboards_path
  end

  private

  def user_params
    params.require(:user).permit(:available_time)
  end
end
