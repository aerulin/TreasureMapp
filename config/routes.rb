Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index]
  resources :missions, only: [:index, :show] do
    resources :challenges, only: [:new, :create]
  end
  resources :challenges, only: [:show]
end
