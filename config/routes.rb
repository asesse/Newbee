Rails.application.routes.draw do
  devise_for :users
  root to: 'activities#index'
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :joined_activities, only: [:edit, :update, :new, :create]
  end
end
