# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  comment         :string
#  rating          :integer          default(5), not null
#  reviewable_type :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  reviewable_id   :integer          not null
#  user_id         :integer          not null
#
# Indexes
#
#  index_reviews_on_reviewable  (reviewable_type,reviewable_id)
#  index_reviews_on_user_id     (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Review < ApplicationRecord
  validates :rating, :user, :reviewable, presence: true
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
end
