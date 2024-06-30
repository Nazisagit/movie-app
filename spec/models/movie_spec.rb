require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    context "presence" do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:year) }
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

  describe "#actors" do
    let!(:movie) { create(:movie) }
    let!(:actor) { create(:persona) }
    before do
      create(:accreditation, :acting_credit, persona: actor, accreditable: movie)
    end

    it { expect(movie.actors).to eq([actor]) }
  end

  describe "#directors" do
    let!(:movie) { create(:movie) }
    let!(:director) { create(:persona) }
    before do
      create(:accreditation, :directing_credit, persona: director, accreditable: movie)
    end

    it { expect(movie.directors).to eq([director]) }
  end

  describe "#update_avg_rating" do
    let!(:movie) { create(:movie) }

    context "if there are no reviews" do
      it { expect(movie.update_avg_rating).to eq(nil) }
    end

    context "if there are reviews" do
      let!(:review) { create(:review, reviewable: movie, user: create(:user)) }
      it { expect(movie.update_avg_rating).to eq(true) }
    end
  end
end
