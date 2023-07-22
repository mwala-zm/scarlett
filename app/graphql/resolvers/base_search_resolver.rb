module Resolvers
  class BaseSearchResolver < GraphQL::Schema::Resolver
    require 'search_object'
    require 'search_object/plugin/graphql'
    include SearchObject.module(:graphql)

    def current_ability
      Ability.new context[:current_resource]
    end
  end
end
