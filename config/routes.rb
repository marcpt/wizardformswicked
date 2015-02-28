Rails.application.routes.draw do
  resources :users
  resources :user_steps
  root to: 'users#index'
end
