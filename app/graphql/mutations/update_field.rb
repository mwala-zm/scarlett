module Mutations
  class UpdateField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true
    field :errors, [String], "List of ActiveModel errors", null: false

    argument :id, GraphQL::Types::ID, required: true
    argument :attributes, Types::Input::FieldInput, required: true

    def resolve(attributes:, id:)
      attributes = attributes.to_h
      current_user = context[:current_resource]
      model = current_user.fields.find_by(id: id)

      if model.nil?
        raise GraphQL::ExecutionError, "Field not found or does not belong to the current user"
      end

      if model.update(attributes.to_h)
        { field: model, errors: model.errors.full_messages }
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
