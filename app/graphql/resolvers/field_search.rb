module Resolvers
  class FieldSearch < Resolvers::BaseSearchResolver
    type [Types::FieldType], null: false
    description "Lists fields"

    scope { Field.accessible_by(current_ability)  }
  
    option(:id, type: GraphQL::Types::ID)   { |scope, value| scope.where id: value }
    option(:name, type: String)   { |scope, value| scope.where name: value }
    option(:size, type: String)   { |scope, value| scope.where size: value }
    option(:created_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where created_at: value }
    option(:updated_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where updated_at: value }
  
    def resolve
      []
    end

  end
end
