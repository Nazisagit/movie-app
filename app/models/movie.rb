# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text             not null
#  title       :string           not null
#  year        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Movie < ApplicationRecord
  validates :title, :description, :year, presence: true
end
