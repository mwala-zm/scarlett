module Types
  class MutationType < Types::BaseObject
    field :deleteField, mutation: Mutations::DeleteField
    field :createField, mutation: Mutations::CreateField
    field :updateField, mutation: Mutations::UpdateField
    field :deleteCrop, mutation: Mutations::DeleteCrop
    field :createCrop, mutation: Mutations::CreateCrop
    field :updateCrop, mutation: Mutations::UpdateCrop
    field :deleteUser, mutation: Mutations::DeleteUser
    field :updateUser, mutation: Mutations::UpdateUser
    field_class GraphqlDevise::Types::BaseField
  end
end
