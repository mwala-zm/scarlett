Rails.application.routes.draw do
  mount_graphql_devise_for User, at: 'api/auth'

  mount RailsAdmin::Engine => 'api/admin', as: 'rails_admin'

  # Graphiql route
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  post "/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
