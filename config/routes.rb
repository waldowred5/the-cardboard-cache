Rails.application.routes.draw do
  resources :board_games
  resources :images
  resources :owned_games
  resources :wished_games
  resources :addresses
  devise_for :users

  root to: "board_games#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
