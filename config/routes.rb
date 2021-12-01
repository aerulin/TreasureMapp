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
    resources :questions do
      post 'validate', as: :validate, to: 'challenge_questions#validate'
      get 'new', to: 'challenge_questions#new'
    end
  end

end
