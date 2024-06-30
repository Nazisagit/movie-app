require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    context "presence" do
      it { should validate_presence_of(:rating) }
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:reviewable) }
    end

    context "uniqueness" do
      before do
        create(:review, reviewable: create(:movie), user: create(:user))
      end

      it { should validate_uniqueness_of(:reviewable_id).scoped_to(:user_id) }
    end
  end

  describe "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:reviewable) }
  end

  describe "#update_reviewable_avg_rating" do
    let(:existing_review) { create(:review, reviewable: reviewable, user: create(:user), rating: 5) }
    let(:new_review) { build(:review, reviewable: reviewable, user: create(:user), rating: 3) }
    let(:reviewable) { create(:movie) }

    context "reviewable has avg_rating attribute" do
      it "receives the callback and returns true" do
        expect(new_review).to receive(:update_reviewable_avg_rating).and_return(true)
        new_review.save
      end
    end

    context "reviewable does not avg_rating attribute" do
      let(:reviewable_double) { double() }
      before { allow(reviewable_double).to receive(:has_attribute?).with(:avg_rating).and_return(false) }

      it "receives the callback and returns false" do
        expect(new_review).to receive(:update_reviewable_avg_rating).and_return(false)
        new_review.save
      end
    end
  end
end
