require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "GET /index" do
    context "movie exists" do
      let!(:movie) { create(:movie) }
      it "returns http success" do
        get movie_reviews_path(movie_id: movie.id)
        expect(response).to have_http_status(:success)
      end
    end

    context "movie does not exist" do
      let(:movie) { double(id: 1000) }
      it "returns http success" do
        get movie_reviews_path(movie_id: movie.id)
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
