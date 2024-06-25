# == Schema Information
#
# Table name: filming_locations
#
#  id            :integer          not null, primary key
#  country       :string           not null
#  filmable_type :string           not null
#  name          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  filmable_id   :integer          not null
#
# Indexes
#
#  index_filming_locations_on_filmable  (filmable_type,filmable_id)
#
class FilmingLocation < ApplicationRecord
  validates :name, :country, presence: true
  validates :name, uniqueness: { scope: :country }
  belongs_to :filmable, polymorphic: true
end
