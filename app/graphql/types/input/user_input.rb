module Types
  module Input
    class UserInput < Types::BaseInputObject
      argument :name, String, required: false
      argument :age, String, required: false
      argument :phone_number, String, required: false
      argument :location, String, required: false
    end
  end
end