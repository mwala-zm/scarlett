class User < ApplicationRecord
  rolify
  # Include default devise modules.
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  # including after calling the `devise` method is important.
  include GraphqlDevise::Authenticatable 

  # make user ID UUID
  before_create do
    self.id = SecureRandom.uuid
  end

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
end

