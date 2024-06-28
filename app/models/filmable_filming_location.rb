# == Schema Information
#
# Table name: filmable_filming_locations
#
#  id                  :integer          not null, primary key
#  filmable_type       :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  filmable_id         :integer          not null
#  filming_location_id :integer          not null
#
# Indexes
#
#  idx_on_filmable_id_filmable_type_filming_location_i_2e9f91d2ed  (filmable_id,filmable_type,filming_location_id) UNIQUE
#  index_filmable_filming_locations_on_filmable                    (filmable_type,filmable_id)
#  index_filmable_filming_locations_on_filming_location_id         (filming_location_id)
#
# Foreign Keys
#
#  filming_location_id  (filming_location_id => filming_locations.id)
#
class FilmableFilmingLocation < ApplicationRecord
  validates :filmable, :filming_location, presence: true
  validates :filming_location, uniqueness: { scope: [:filmable_id, :filmable_type] }
  belongs_to :filmable, polymorphic: true
  belongs_to :filming_location
end
