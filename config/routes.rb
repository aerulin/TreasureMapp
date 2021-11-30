Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :challenges, only: [:show]
  resources :missions, only: [:index, :show] do
    resources :challenges, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
