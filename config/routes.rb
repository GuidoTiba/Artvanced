Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#welcome'
  get '/home', to: 'pages#home'
  resources :artworks, only: [:index, :new, :create, :show, :purchase] do
    resources :purchases, only: [:new, :create]
  end

  resources :purchases, only: [] do
    resources :reviews, only: [:new, :create]
  end
  # get '/artworks/:artwork_id/purchase/', to: 'purchases#buy', as: 'buy'
  # post '/artworks/:artwork_id/purchase/', to: 'purchases#create', as: 'artwork_purchases'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
