require 'rails_helper'

RSpec.describe MovieReviewCreationService, type: :service do
  let(:service) { MovieReviewCreationService.new(user, rating, comment) }
  describe "#review" do
    context "movie exists" do
      let!(:movie) { create(:movie) }

      context "user exists" do
        let!(:user) { create(:user) }
        let(:rating) { 3 }
        let(:comment) { Faker::Restaurant.review }

        it { expect(service.review(movie.title)).to eq(movie.reload.reviews.last) }

        context "rating is nil" do
          let(:rating) { nil }

          it { expect {service.review(movie.title) }.to raise_error(MovieReviewCreationService::RatingNotProvided) }
        end

        context "rating is zero" do
          let(:rating) { 0 }

          it { expect {service.review(movie.title) }.to raise_error(MovieReviewCreationService::OneStarMinimumRating) }
        end
      end

      context "user does not exist" do
        it { expect { service.review(movie.title).to raise_error(MovieReviewCreationService::UserNotProvided) }}
      end
    end

    context "movie does not exist" do
      let(:movie) { nil }
      let(:user) { build(:user) }
      let(:rating) { 1 }
      let(:comment) { "" }

      it { expect{ service.review(movie&.title) }.to raise_error(MovieReviewCreationService::MovieNotFound) }
    end
  end
end
