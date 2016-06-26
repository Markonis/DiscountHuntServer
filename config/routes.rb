Rails.application.routes.draw do
  resources :user_sessions
  resources :friendships
  resources :discounts
  resources :settings
  resources :users

  # Routes for testing
  if Rails.env.test?
    post 'test' => 'testing#test'
    get  'test' => 'testing#test'
  end
end
