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

    context "uniqueness" do
      let!(:persona) { create(:persona) }
      let!(:accreditable) { create(:movie) }
      let(:accreditation_type) { :actor }
      before do
        create(:accreditation, :acting_credit, accreditable: accreditable, persona: persona)
      end
      it "validates the uniqueness of the accreditable and accreditation type to the persona" do
        should validate_uniqueness_of(:accreditable_id).scoped_to(:persona_id)
        should validate_uniqueness_of(:accreditable_id).scoped_to(:persona_id)
        should validate_uniqueness_of(:accreditation_type).ignoring_case_sensitivity.scoped_to(:persona_id)
      end
    end
  end

  describe "relations" do
    it { should belong_to(:persona) }
    it { should belong_to(:accreditable) }
  end
end
