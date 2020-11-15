Rails.application.routes.draw do
  resources :trades
  resources :board_games
  resources :images
  resources :wished_games, except: [:create]
  resources :owned_games, except: [:create]
  resources :addresses
  devise_for :users

  post '/wished_games/:id', to: 'wished_games#create', as: 'create_wished_game'
  post '/owned_games/:id', to: 'owned_games#create', as: 'create_owned_game'

  root to: "board_games#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
