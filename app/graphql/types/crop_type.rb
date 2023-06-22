# frozen_string_literal: true

module Types
  class CropType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :growth_stage, String
    field :description, String
    field :crop_family, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
