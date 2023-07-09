module Types
  module Input
    class FieldInput < Types::BaseInputObject
      argument :name, String, required: false
      argument :size, String, required: false
    end
  end
end
