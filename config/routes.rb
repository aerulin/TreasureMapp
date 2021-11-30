Rails.application.routes.draw do
  get 'missions/index'
  get 'missions/show'
  devise_for :users
  root to: 'pages#home'
  resources :missions, only: [:index, :show]
  resources :users, only: [:index]
end
