require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    context "presence" do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:year) }
      it { should validate_presence_of(:filmable_filming_locations) }
      it { should validate_presence_of(:filming_locations) }
    end

    context "uniqueness" do
      before do
        create(:movie)
      end

      it { should validate_uniqueness_of(:title).scoped_to(:year) }
    end
  end

  describe "relations" do
    it { should have_many(:accreditations) }
    it { should have_many(:personas).through(:accreditations) }
    it { should have_many(:reviews) }
    it { should have_many(:filmable_filming_locations) }
    it { should have_many(:filming_locations) }
  end
end
