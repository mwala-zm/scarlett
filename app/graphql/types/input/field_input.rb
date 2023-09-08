module Types
  module Input
    class FieldInput < Types::BaseInputObject
      argument :name, String, required: false
      argument :size, String, required: false
      argument :location, String, required: false
      argument :field_geometry, String, required: true
    end
  end
end
