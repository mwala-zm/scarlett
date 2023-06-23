# == Schema Information
#
# Table name: fields
#
#  id         :integer          not null, primary key
#  name       :string
#  size       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_fields_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Field < ApplicationRecord
  belongs_to :user
end
