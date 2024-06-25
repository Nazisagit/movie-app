# == Schema Information
#
# Table name: personas
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Persona < ApplicationRecord
  validates :name, presence: true
  has_many :accreditations
  has_many :movies, through: :accreditations, source: :accreditable, source_type: "Movie"
end
