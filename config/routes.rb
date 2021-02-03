Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#welcome'
  get '/home', to: 'pages#home'
  get 'users/:id/my_artworks', to: 'artworks#my_artworks', as: 'user_artworks'
  patch 'users/:id/my_artworks/:id', to: 'artworks#toggle_sale', as: 'artwork_toggle_sale'
  resources :artworks, only: [:index, :new, :create, :show, :purchase, :edit, :update] do
    resources :purchases, only: [:new, :create]
  end

  resources :purchases, only: [] do
    resources :reviews, only: [:new, :create]
  end

end
