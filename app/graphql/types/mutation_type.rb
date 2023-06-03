module Types
  class MutationType < Types::BaseObject
		field :deleteUser, mutation: Mutations::DeleteUser
		field :updateUser, mutation: Mutations::UpdateUser
    field_class GraphqlDevise::Types::BaseField
  end
end
