Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  delete :logout, to: 'sessions#destroy'

  root 'tests#index'

  resources :answers
  resources :sessions, only: %i[create]
  resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    post :start, on: :member
  end

  resources :categories

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
