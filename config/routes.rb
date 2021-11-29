Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :users do
    resources :favoris, only: [:create, :index]
  end
  resources :user_media_types, only: [:create, :destroy]
  resources :user_categories, only: [:create, :destroy]
  resources :favoris, only: [:destroy]
  resources :dashboards, only: [:index]
  resources :articles, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
