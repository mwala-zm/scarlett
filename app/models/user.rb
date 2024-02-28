# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  allow_password_change  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  location               :string
#  middle_name            :string           default("")
#  phone_number           :string
#  provider               :string           default("email"), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  tokens                 :text
#  uid                    :string           default(""), not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#
class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # :confirmable

  # including after calling the `devise` method is important.
  include GraphqlDevise::Authenticatable
  has_many :fields, dependent: :destroy
  validate :validate_phone_number
  # before_save :format_name
  before_save :format_phone

  after_create :assign_default_role

  def assign_default_role
    add_role(:sclt) if roles.blank?
  end

  private

  def format_name
    errors.add(:first_name, "Names can't be nil") if first_name.nil? && last_name.nil
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end

  def validate_phone_number
    errors.add(:phone_number, "can't be nil") if phone_number.nil?
    return if Phonelib.valid?(phone_number)

    errors.add(:phone_number, ' is not valid')
  end

  def format_phone
    self.phone_number = Phonelib.parse(phone_number).e164
  end
end
