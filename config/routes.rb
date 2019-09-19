Rails.application.routes.draw do

  get 'users/new'
  root 'tests#index'

  resources :answers

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

  resources :users, only: :create

  get :signup, to: 'users#new'
end
