# == Schema Information
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  comment         :string           default("")
#  rating          :integer          default(5), not null
#  reviewable_type :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  reviewable_id   :integer          not null
#  user_id         :integer          not null
#
# Indexes
#
#  index_reviews_on_reviewable                 (reviewable_type,reviewable_id)
#  index_reviews_on_reviewable_id_and_user_id  (reviewable_id,user_id) UNIQUE
#  index_reviews_on_user_id                    (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Review < ApplicationRecord
  validates :rating, :user, :reviewable, :comment, presence: true
  validates :reviewable_id, uniqueness: { scope: :user_id }
  validates :rating, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
  belongs_to :user
  belongs_to :reviewable, polymorphic: true
  after_save :update_reviewable_avg_rating

  def update_reviewable_avg_rating
    return false if !reviewable.has_attribute?(:avg_rating)
    reviewable.update_avg_rating
  end
end
