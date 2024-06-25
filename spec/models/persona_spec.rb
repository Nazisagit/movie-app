require 'rails_helper'

RSpec.describe Persona, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "relations" do
    it { should have_many(:accreditations) }
    it { should have_many(:movies).through(:accreditations) }
  end
end
