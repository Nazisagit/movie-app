require 'rails_helper'

RSpec.describe Persona, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }

    context "uniqueness" do
      before do
        create(:persona)
      end
      it { should validate_uniqueness_of(:name) }
    end
  end

  describe "relations" do
    it { should have_many(:accreditations) }
    it { should have_many(:movies).through(:accreditations) }
  end
end
