module Mutations
  class UpdateUser < Mutations::BaseMutation
    field :user, Types::UserType, null: true
    field :errors, [String], "List of ActiveModel errors", null: false

    argument :attributes, Types::Input::UserInput, required: true

    def resolve(attributes:)
      attributes = attributes.to_h
      puts attributes[:uid]
      
      #if model.update(attributes.to_h)
       # { user: model }
      #else
       # { errors: model.errors.full_messages }
      #end
    end
  end
end
