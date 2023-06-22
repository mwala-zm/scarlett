module Mutations
  class DeleteField < Mutations::BaseMutation
    field :field, Types::FieldType, null: true

    argument :id, GraphQL::Types::ID, required: true

    def resolve(id:)
      model = Field.find(id)

      model.destroy
      {field: model}
    end
  end
end