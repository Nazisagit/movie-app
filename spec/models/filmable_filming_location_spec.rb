require 'rails_helper'

RSpec.describe FilmableFilmingLocation, type: :model do
  describe "validations" do
    it { should validate_presence_of(:filmable) }
    it { should validate_presence_of(:filming_location)}
  end

  describe "relations" do
    it { should belong_to(:filmable) }
    it { should belong_to(:filming_location) }
  end
end
