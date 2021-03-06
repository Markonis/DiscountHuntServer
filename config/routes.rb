Rails.application.routes.draw do
  resources :friends_rankings
  resources :discount_votes
  resources :user_location_changes
  resources :user_searches
  resources :discount_searches
  resources :user_sessions, only: [:create, :update]
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
