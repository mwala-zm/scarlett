module Resolvers
  class UserSearch < Resolvers::BaseSearchResolver
    type [Types::UserType], null: false
    description "Lists users"

    scope { User.accessible_by(current_ability) }
  
    option(:id, type: GraphQL::Types::ID)   { |scope, value| scope.where id: value }
    option(:provider, type: String)   { |scope, value| scope.where provider: value }
    option(:uid, type: String)   { |scope, value| scope.where uid: value }
    option(:encrypted_password, type: String)   { |scope, value| scope.where encrypted_password: value }
    option(:reset_password_token, type: String)   { |scope, value| scope.where reset_password_token: value }
    option(:reset_password_sent_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where reset_password_sent_at: value }
    option(:allow_password_change, type: Boolean)   { |scope, value| scope.where allow_password_change: value }
    option(:remember_created_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where remember_created_at: value }
    option(:confirmation_token, type: String)   { |scope, value| scope.where confirmation_token: value }
    option(:confirmed_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where confirmed_at: value }
    option(:confirmation_sent_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where confirmation_sent_at: value }
    option(:name, type: String)   { |scope, value| scope.where name: value }
    option(:location, type: String)   { |scope, value| scope.where location: value }
    option(:phone_number, type: String)   { |scope, value| scope.where phone_number: value }
    option(:email, type: String)   { |scope, value| scope.where email: value }
    option(:tokens, type: String)   { |scope, value| scope.where tokens: value }
    option(:created_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where created_at: value }
    option(:updated_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where updated_at: value }
    option(:sign_in_count, type: Int)   { |scope, value| scope.where sign_in_count: value }
    option(:current_sign_in_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where current_sign_in_at: value }
    option(:last_sign_in_at, type: GraphQL::Types::ISO8601DateTime)   { |scope, value| scope.where last_sign_in_at: value }
    option(:current_sign_in_ip, type: String)   { |scope, value| scope.where current_sign_in_ip: value }
    option(:last_sign_in_ip, type: String)   { |scope, value| scope.where last_sign_in_ip: value }
  
    def resolve
      []
    end

  end
end
