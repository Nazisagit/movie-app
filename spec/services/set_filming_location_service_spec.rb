require 'rails_helper'

RSpec.describe SetFilmingLocationService, type: :service do
  let(:service) { SetFilmingLocationService.new(filming_location) }

  context "filming location exists" do
    let!(:filming_location) { create(:filming_location) }
    let!(:filmable) { create(:movie) }

    it { expect { service.set(filmable) }.to change(FilmableFilmingLocation, :count).by(1) }
    it { expect(service.set(filmable)).to eq(filmable.filming_locations) }
  end

  context "filming location does not exist" do
    let(:filming_location) { nil }
    let!(:filmable) { create(:movie) }
    it { expect { service.set(filmable) }.to raise_error(SetFilmingLocationService::NoFilmingLocationProvided) }
  end

  context "filming location already exists for film" do
    let!(:filming_location) { create(:filming_location) }
    let!(:filmable) { create(:movie, filming_locations: [filming_location]) }

    it { expect { service.set(filmable) }.not_to raise_error }
    it { expect { service.set(filmable) }.not_to change(FilmableFilmingLocation, :count).from(1) }
    it { expect(service.set(filmable)).to eq(filmable.filming_locations) }
  end
end
