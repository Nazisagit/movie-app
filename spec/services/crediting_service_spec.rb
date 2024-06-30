require 'rails_helper'

RSpec.describe CreditingService, type: :service do
  describe "#accredit" do
    let(:accreditable) { create(:movie) }
    let(:service) { CreditingService.new(persona) }

    context "persona is provided" do
      let(:persona) { create(:persona) }
      context "as director" do
        it { expect { service.accredit(accreditable, :director) }.to change(Accreditation, :count).by(1) }
      end

      context "as actor" do
        it { expect { service.accredit(accreditable, :actor) }.to change(Accreditation, :count).by(1) }
      end

      context "accreditable value is null" do
        let(:accreditable) { nil }
        it { expect { service.accredit(accreditable, :director) }.to raise_error(CreditingService::NoAccreditableToCredit) }
      end

      context "accreditation type does not exist" do
        it { expect { service.accredit(accreditable, :producer) }.to raise_error(CreditingService::AccreditationTypeDoesNotExist) }
      end
    end

    context "persona value is null" do
      let(:persona) { nil }
      it { expect { service.accredit(accreditable, :actor) }.to raise_error(CreditingService::NoPersonaToCredit) }
    end

    context "accreditation already exists" do
      let!(:persona) { create(:persona) }
      let!(:accreditation) { create(:accreditation, accreditable: accreditable, persona: persona, accreditation_type: :actor) }
      it { expect { service.accredit(accreditable, :actor) }.not_to change(Accreditation, :count).from(1) }
      it { expect { service.accredit(accreditable, :actor) }.not_to raise_error }
      it { expect(service.accredit(accreditable, :actor)).to eq(accreditation) }
    end
  end
end
