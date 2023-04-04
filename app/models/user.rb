class User < ApplicationRecord
  # make user ID UUID
  before_create do
    self.id = SecureRandom.uuid
  end
end
