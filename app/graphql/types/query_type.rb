module Types
  class QueryType < Types::BaseObject
		field :fields, resolver: Resolvers::FieldSearch 
    # Include queries provided by graphql_devise
    field_class GraphqlDevise::Types::BaseField

    # Get all users
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    # Get a specific user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end
  end
end
