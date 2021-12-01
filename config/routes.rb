Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:index]
  resources :missions, only: [:index, :show] do
    resources :challenges, only: [:create]
  end
  resources :challenges, only: [:show] do
    resources :questions do
      post 'validate', as: :validate, to: 'challenge_questions#validate'
      get 'new', to: 'challenge_questions#new'
    end
    get 'map', to: 'challenges#map'
  end
end
