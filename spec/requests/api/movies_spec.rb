require 'rails_helper'

RSpec.describe "Api::Movies", type: :request do
  describe "GET /index" do
    it do
      get api_movies_path
      expect(response).to have_http_status(:success)
    end

    context "when there are movies" do
      let(:rating_1) { 5 }
      let!(:movie_1) { create(:movie, filming_locations: [create(:filming_location)], avg_rating: rating_1) }
      let!(:actor_1) { create(:accreditation, :acting_credit, persona: create(:persona), accreditable: movie_1) }
      let!(:director_1) { create(:accreditation, :directing_credit, persona: create(:persona), accreditable: movie_1) }
      let!(:review_1) { create(:review, reviewable: movie_1, rating: rating_1) }

      let(:rating_2) { 3 }
      let!(:movie_2) { create(:movie, filming_locations: [create(:filming_location)], avg_rating: rating_2) }
      let!(:actor_2) { create(:accreditation, :acting_credit, persona: create(:persona), accreditable: movie_2) }
      let!(:director_2) { create(:accreditation, :directing_credit, persona: create(:persona), accreditable: movie_2) }
      let!(:review_2) { create(:review, reviewable: movie_2, rating: rating_2) }

      let(:rating_3) { 1 }
      let!(:movie_3) { create(:movie, filming_locations: [create(:filming_location)], avg_rating: rating_3) }
      let!(:actor_3) { create(:accreditation, :acting_credit, persona: create(:persona), accreditable: movie_3) }
      let!(:director_3) { create(:accreditation, :directing_credit, persona: create(:persona), accreditable: movie_3) }
      let!(:review_3) { create(:review, reviewable: movie_3, rating: rating_3) }

      let(:movies) { response.parsed_body["movies"] }

      it "to return movies in order of descending avg rating" do
        get api_movies_path
        expect(movies[0]["title"]).to eq(movie_1.title)
        expect(movies[1]["title"]).to eq(movie_2.title)
        expect(movies[2]["title"]).to eq(movie_3.title)
      end
    end

    context "when there are no movies" do
      it do
        get api_movies_path
        expect(response.parsed_body["movies"]).to eq([])
      end
    end
  end
end
