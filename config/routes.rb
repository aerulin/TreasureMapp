Rails.application.routes.draw do
  get 'challenge/show'
  get 'challenge/new'
  get 'challenge/create'
  get 'missions/index'
  get 'missions/show'
  devise_for :users
  root to: 'pages#home'

  resources :missions, only: [:index, :show] do
    resources :challenges, only: [:show, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
