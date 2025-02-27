Rails.application.routes.draw do
  get 'messages/create'
  # get 'rooms/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get '/signout', to: 'sessions#destroy', as: :signout
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  # Defines the root path route ("/")
  # root "posts#index"
  resources :rooms
  resources :users
  root 'rooms#index'

  resources :rooms do
    resources :messages
  end
end
