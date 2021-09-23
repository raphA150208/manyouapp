Rails.application.routes.draw do
  root 'tasks#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :tasks do
    collection do
      post :confirm
    end
  end
  namespace :admin do
    resources :users
  end
end
