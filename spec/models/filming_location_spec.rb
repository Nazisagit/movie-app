require 'rails_helper'

RSpec.describe FilmingLocation, type: :model do
  describe "validations" do
    context "presence" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:country) }
    end

    context "uniqueness" do
      before do
        create(:filming_location)
      end
      it { should validate_uniqueness_of(:name).scoped_to(:country) }
    end
  end

  describe "relations" do
    
  end
end
