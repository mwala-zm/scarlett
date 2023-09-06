# == Schema Information
#
# Table name: fields
#
#  id             :bigint           not null, primary key
#  field_geometry :geography        geometry, 4326
#  location       :string
#  name           :string
#  size           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_fields_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Field < ApplicationRecord
  belongs_to :user
end
