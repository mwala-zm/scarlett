module Mutations
  class UpdateUser < Mutations::BaseMutation
    field :user, Types::UserType, null: true

    argument :id, GraphQL::Types::ID, required: true
    argument :attributes, Types::Input::UserInput, required: true

    def resolve(attributes:, id:)
      model = User.find(id)

      if model.update(attributes.to_h)
        { user: model }
      else
        { errors: model.errors.full_messages }
      end
    end
  end
end
