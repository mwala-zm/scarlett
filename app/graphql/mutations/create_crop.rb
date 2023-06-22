module Mutations
  class CreateCrop < Mutations::BaseMutation
    field :crop, Types::CropType, null: true

    argument :attributes, Types::Input::CropInput, required: true

    def resolve(attributes:)
      model = Crop.new(attributes.to_h)

      if model.save
        {crop: model}
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
