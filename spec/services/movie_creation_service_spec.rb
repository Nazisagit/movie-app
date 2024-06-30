require 'rails_helper'

RSpec.describe MovieCreationService, type: :service do
  describe "#create" do
    let(:service) { MovieCreationService.new(title, description, year) }
    context "movie does not exist" do
      let(:title) { Faker::Movie.title }
      let(:description) { Faker::Movie.quote }
      let(:year) { 2000 }

      it { expect { service.create }.to change(Movie, :count).by(1) }
      it { expect(service.create).to be_instance_of(Movie) }
    end

    context "movie already exists" do
      let!(:title) { Faker::Movie.title }
      let!(:description) { Faker::Movie.quote }
      let(:year) { 2000 }
      let!(:movie) { create(:movie, title: title, description: description, year: year) }

      it { expect { service.create }.not_to change(Movie, :count).from(1) }
      it { expect { service.create }.not_to raise_error }
      it { expect(service.create).to eq(movie) }
    end
  end
end
