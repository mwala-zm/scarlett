module Types
  module Input
    class CropInput < Types::BaseInputObject
      argument :name, String, required: false
      argument :growth_stage, String, required: false
      argument :description, String, required: false
      argument :crop_family, String, required: false
    end
  end
end