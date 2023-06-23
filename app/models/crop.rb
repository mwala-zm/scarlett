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
class Crop < ApplicationRecord
end
