require 'rails_helper'

RSpec.describe PersonaCreationService, type: :service do
  describe "#create" do
    let(:service) { PersonaCreationService.new("Nazrin") }
    context "unique name" do
      it { expect { service.create }.to change(Persona, :count).by(1) }
      it { expect(service.create).to be_instance_of(Persona) }
    end

    context "non-unique name" do
      context "non-race conditions" do
        let!(:persona) { create(:persona, name: "Nazrin") }
        it { expect { service.create }.not_to change(Persona, :count).from(1) }
        it { expect { service.create }.not_to raise_error }
        it { expect(service.create).to eq(persona) }
      end
    end
  end
end
