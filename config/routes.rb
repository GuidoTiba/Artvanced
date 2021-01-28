Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :artworks, only: [:index, :show]
  post '/artworks/:artwork_id/purchase', to: 'purchases#create', as: 'buy_artwork'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
