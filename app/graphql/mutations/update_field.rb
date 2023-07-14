module Mutations
  class UpdateField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true
    field :errors, [String], "List of ActiveModel errors", null: false

    argument :attributes, Types::Input::FieldInput, required: true
    
    def resolve(attributes:)
      attributes = attributes.to_h
      model = Field.find_by! id: attributes[:id], user: context[:current_resource]

      if model.update_attributes(attributes.to_h)
        {field: model, errors: model.errors.full_messages}
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
