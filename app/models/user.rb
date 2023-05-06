class User < ApplicationRecord
  rolify
  # Include default devise modules.
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable,
         :timeoutable

  # including after calling the `devise` method is important.
  include GraphqlDevise::Authenticatable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:field) if self.roles.blank?
  end

  # make user ID UUID
  before_create do
    self.id = SecureRandom.uuid
  end

end

