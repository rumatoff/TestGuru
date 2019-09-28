Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  root 'tests#index'

  resources :answers
  resources :sessions, only: :create
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
