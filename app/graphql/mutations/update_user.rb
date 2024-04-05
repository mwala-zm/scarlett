module Mutations
  class UpdateUser < Mutations::BaseMutation
    field :user, Types::UserType, null: true
    field :errors, [String], 'List of ActiveModel errors', null: false

    argument :attributes, Types::Input::UserInput, required: true

    def resolve(attributes:)
      user = User.find(context[:current_resource].id)
      current_ability.authorize! :update, user

      if user.nil?
        return {
          user: nil,
          errors: ['You need to authenticate to perform this action']
        }
      end

      if user.update(attributes.to_h)
        {
          user:,
          errors: user.errors.full_messages
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
