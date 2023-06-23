# == Schema Information
#
# Table name: crops
#
#  id           :integer          not null, primary key
#  crop_family  :string
#  description  :text
#  growth_stage :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Crop, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
