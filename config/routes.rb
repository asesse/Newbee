Rails.application.routes.draw do
  devise_for :users
  root to: 'activities#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :joined_activities, only: [:edit, :update]
  end
end
