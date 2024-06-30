# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  avg_rating  :integer          default(0), not null
#  description :text             not null
#  title       :string           not null
#  year        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_movies_on_title_and_year  (title,year) UNIQUE
#
class Movie < ApplicationRecord
  validates :title, :description, :year, presence: true
  validates :title, uniqueness: { scope: :year }
  has_many :accreditations, as: :accreditable
  has_many :personas, through: :accreditations
  has_many :reviews, as: :reviewable
  has_many :filmable_filming_locations, as: :filmable
  has_many :filming_locations, through: :filmable_filming_locations

  def actors
    accreditations.actor.map(&:persona)
  end

  def directors
    accreditations.director.map(&:persona)
  end
end
