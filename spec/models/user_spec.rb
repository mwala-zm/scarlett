require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User validations' do
    user = User.new(first_name: 'Jon', last_name: 'Doe', email: 'user@email.com', phone_number: '0970010201',
                    password: 'password')
  end
end
