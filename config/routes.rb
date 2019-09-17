Rails.application.routes.draw do

  root 'tests#index'

  resources :answers

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
  end

  resources :categories
end
