class User < ApplicationRecord
  include GraphqlDevise::Authenticatable
  # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                    :confirmable, :omniauthable

  # make user ID UUID
  before_create do
    self.id = SecureRandom.uuid
  end
end
