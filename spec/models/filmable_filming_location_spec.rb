require 'rails_helper'

RSpec.describe FilmableFilmingLocation, type: :model do
  describe "validations" do
    context "presence" do
      it { should validate_presence_of(:filmable) }
      it { should validate_presence_of(:filming_location) }
    end

    context "uniqueness" do
      context "unique film locations per movie" do
        let(:filming_location) { create(:filming_location) }
        let(:movie) do
          create(:movie, filming_locations: [filming_location])
        end

        subject do
          build(
            :filmable_filming_location,
            filmable: movie,
            filming_location: create(:filming_location)
          )
        end

        it { should validate_uniqueness_of(:filming_location).scoped_to([:filmable_id, :filmable_type]) }
      end
    end
  end

  describe "relations" do
    it { should belong_to(:filmable) }
    it { should belong_to(:filming_location) }
  end
end
