Rails.application.routes.draw do
  root 'pages#home'
  mount_graphql_devise_for User, at: 'api/auth'

  get 'crops/index'

  devise_for :users
  resource :crops

  mount RailsAdmin::Engine => 'admin', as: 'rails_admin' if Rails.env.development?

  post '/graphql', to: 'graphql#execute'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: 'home#index'
end
