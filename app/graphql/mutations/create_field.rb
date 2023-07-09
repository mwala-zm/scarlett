module Mutations
  class CreateField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true
    field :errors, [String], "List of ActiveModel errors", null: false

    argument :attributes, Types::Input::FieldInput, required: true

    def resolve(attributes:)
      attributes = attributes.to_h
      attributes.to_h[:user] = User.find_by! id: context[:current_resource].id
      model = Field.new(attributes.to_h)

      if model.save
        {field: model, errors: model.errors.full_messages}
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
