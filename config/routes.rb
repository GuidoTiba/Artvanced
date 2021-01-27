Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :artworks, only: :index
  patch '/artworks/:artwork_id', to: 'artworks#buy', as: 'buy_artwork'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
