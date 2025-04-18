# == Schema Information
#
# Table name: crops
#
#  id           :bigint           not null, primary key
#  crop_family  :string
#  description  :text
#  growth_stage :string
#  name         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Crop < ApplicationRecord
  extend Mobility

  translates :name, type: :string
  translates :crop_family, type: :string
  translates :growth_stage, type: :string
end
