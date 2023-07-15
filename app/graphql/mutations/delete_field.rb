module Mutations
  class DeleteField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true
    field :errors, [String], "List of ActiveRecord errors", null: false

    argument :id, GraphQL::Types::ID, required: true

    def resolve(id:)
      current_user = context[:current_resource]
      model = current_user.fields.find_by(id: id)

      if model.nil?
        raise GraphQL::ExecutionError, "Field does not exist"
      end

      model.destroy
      { field: model, errors: model.errors.full_messages }
    end
  end
end
