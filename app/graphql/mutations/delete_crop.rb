module Mutations
  class DeleteCrop < Mutations::BaseMutation
    field :crop, Types::CropType, null: true

    argument :id, GraphQL::Types::ID, required: true

    def resolve(id:)
      model = Crop.find(id)

      model.destroy
      {crop: model}
    end
  end
end