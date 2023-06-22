module Mutations
  class UpdateField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true

    argument :id, GraphQL::Types::ID, required: true
    argument :attributes, Types::Input::FieldInput, required: true
    
    def resolve(attributes:, id:)
      model = Field.find(id)

      if model.update_attributes(attributes.to_h)
        {field: model}
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
