# == Schema Information
#
# Table name: filming_locations
#
#  id         :integer          not null, primary key
#  country    :string           not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_filming_locations_on_name_and_country  (name,country) UNIQUE
#
class FilmingLocation < ApplicationRecord
  validates :name, :country, presence: true
  validates :name, uniqueness: { scope: :country }
  has_many :filmable_filming_locations
  has_many :filmables, through: :filmable_filming_locations
end
