Rails.application.routes.draw do
  resources :trades, except: [:create]
  resources :board_games
  resources :images
  resources :wished_games, except: [:create, :destroy]
  resources :owned_games, except: [:create, :destroy]
  resources :addresses
  devise_for :users

  # Custom trades routes
  post '/trades/', to: 'trades#create', as: 'create_trade'

  # Custom wished_games routes
  post '/wished_games/:id', to: 'wished_games#create', as: 'create_wished_game'
  delete '/wished_games/:id', to: 'wished_games#destroy', as: 'destroy_wished_game'

  # Custom owned_games routes
  post '/owned_games/:id', to: 'owned_games#create', as: 'create_owned_game'
  delete '/owned_games/:id', to: 'owned_games#destroy', as: 'destroy_owned_game'

  root to: "board_games#index"
end
