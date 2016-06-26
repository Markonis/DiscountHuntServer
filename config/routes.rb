Rails.application.routes.draw do
  resources :user_sessions
  resources :friendships
  resources :discounts
  resources :settings
  resources :users
end
