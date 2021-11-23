Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :user_media_types, only: [:create, :destroy]
  resources :user_categories, only: [:create, :destroy]
  resources :favoris, only: [:create, :destroy, :index]
  resources :dashboards, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
