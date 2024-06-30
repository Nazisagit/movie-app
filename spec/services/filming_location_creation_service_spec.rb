require 'rails_helper'

RSpec.describe FilmingLocationCreationService, type: :service do
  let(:service) { FilmingLocationCreationService.new(location_name, country) }

  context "filming location does not exist" do
    let(:location_name) { Faker::Address.city }
    let(:country) { Faker::Address.country }

    it { expect { service.create }.to change(FilmingLocation, :count).by(1) }
  end

  context "filming location already exists" do
    let(:location_name) { "Pinewood" }
    let(:country) { "US" }
    let!(:filming_location) { create(:filming_location, name: location_name, country: country) }

    it { expect { service.create }.not_to change(FilmingLocation, :count).from(1) }
    it { expect { service.create }.not_to raise_error }
    it { expect(service.create).to eq(filming_location) }
  end
end
