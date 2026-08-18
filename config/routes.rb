Rails.application.routes.draw do
  devise_for :users

  resources :tasks do
    member do
      patch :change_status
    end
  end

  resources :projects

  root "tasks#index"
end
