module Types
  class MutationType < Types::BaseObject
		field :deleteUser, mutation: Mutations::DeleteUser
		field :createUser, mutation: Mutations::CreateUser
		field :updateUser, mutation: Mutations::UpdateUser

  end
end
