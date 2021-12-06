Rails.application.routes.draw do
  devise_for :users
  root to: 'users#playground'
  resources :users, only: [:index] do
    collection do
      get :playground
    end
  end

  resources :missions, only: [:index, :show] do
    resources :challenges, only: [:create]
  end

  resources :challenges, only: [:show] do
    get "test_geolocalisation", to: "challenges#geocode"
    post 'validate', as: :validate
    resources :questions do
      post 'validate', as: :validate, to: 'challenge_questions#validate'
      get 'new', to: 'challenge_questions#new'
    end
    get 'map', to: 'challenges#map'
    post 'map', as: :validate, to: 'challenge_questions#validate'
    get 'score', to: 'challenges#score'
  end
end
