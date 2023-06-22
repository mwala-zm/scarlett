module Mutations
  class CreateField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true

    argument :attributes, Types::Input::FieldInput, required: true

    def resolve(attributes:)
      model = Field.new(attributes.to_h)

      if model.save
        {field: model}
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
