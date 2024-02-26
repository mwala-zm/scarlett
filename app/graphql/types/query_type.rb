module Types
  class QueryType < Types::BaseObject
    field :users, resolver: Resolvers::UserSearch
    field :fields, resolver: Resolvers::FieldSearch

    # Include queries provided by graphql_devise
    field_class GraphqlDevise::Types::BaseField

    def user
      user = User.find(context[:current_resource].id)
      current_ability.authorize! :read, user
    end
  end
end
