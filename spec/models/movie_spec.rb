require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:year) }
  end

  describe "relations" do
    it { should have_many(:accreditations) }
    it { should have_many(:personas).through(:accreditations) }
  end
end
