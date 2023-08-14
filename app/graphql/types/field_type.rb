# frozen_string_literal: true

module Types
  class FieldType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :size, String
    field :location, String
    field :user, Types::UserType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
