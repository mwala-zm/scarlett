module Mutations
  class UpdateField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true
    field :errors, [String], 'List of ActiveModel errors', null: false

    argument :id, GraphQL::Types::ID, required: true
    argument :attributes, Types::Input::FieldInput, required: true

    def resolve(attributes:, id:)
      attributes = attributes.to_h
      model = Field.find_by(id:)
      current_ability.authorize! :update, model

      raise GraphQL::ExecutionError, 'Field not found or does not belong to the current user' if model.nil?

      if model.update(attributes.to_h)
        { field: model, errors: model.errors.full_messages }
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
