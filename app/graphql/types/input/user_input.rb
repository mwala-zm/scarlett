module Types
  module Input
    class UserInput < Types::BaseInputObject
      argument :provider, String, required: true
      argument :uid, String, required: true
      argument :encrypted_password, String, required: true
      argument :reset_password_token, String, required: false
      argument :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :allow_password_change, Boolean, required: false
      argument :remember_created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :confirmation_token, String, required: false
      argument :confirmed_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :confirmation_sent_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :unconfirmed_email, String, required: false
      argument :location, String, required: false
      argument :phone_number, String, required: false
      argument :email, String, required: false
      argument :tokens, String, required: false
      argument :sign_in_count, Int, required: true
      argument :current_sign_in_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :last_sign_in_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :current_sign_in_ip, String, required: false
      argument :last_sign_in_ip, String, required: false
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :middle_name, String, required: false
    end
  end
end
