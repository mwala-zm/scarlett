Rails.application.routes.draw do
<<<<<<< HEAD
  mount_graphql_devise_for User, at: 'api/auth'

  devise_for :users

  if Rails.env.development?
    mount RailsAdmin::Engine => 'auth/admin', as: 'rails_admin'
  end

  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root to: 'home#index'
=======
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
>>>>>>> 52a5644 (shift)
end
