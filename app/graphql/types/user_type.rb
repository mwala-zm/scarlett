# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: true
    field :name, String
    field :phone_number, String
    field :location, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
