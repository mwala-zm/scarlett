module Mutations
  class UpdateCrop < Mutations::BaseMutation
    field :crop, Types::CropType, null: true

    argument :id, GraphQL::Types::ID, required: true
    argument :attributes, Types::Input::CropInput, required: true

    def resolve(attributes:, id:)
      model = Crop.find(id)

      if model.update_attributes(attributes.to_h)
        { crop: model }
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
