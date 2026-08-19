Rails.application.routes.draw do
  devise_for :users

  resources :tasks do
    member do
      patch :change_status
    end
  end

  resources :projects

  resource :dashboard, only: [:show], controller: "dashboard"

  root "tasks#index"
end
