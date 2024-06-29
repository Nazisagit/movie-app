require 'rails_helper'

RSpec.describe Accreditation, type: :model do
  describe "definitions" do
    it { should define_enum_for(:accreditation_type) }
  end

  describe "validations" do
    context "presence" do
      it { should validate_presence_of(:accreditation_type) }
      it { should validate_presence_of(:persona) }
      it { should validate_presence_of(:accreditable) }
    end
  end

  describe "relations" do
    it { should belong_to(:persona) }
    it { should belong_to(:accreditable) }
  end
end
