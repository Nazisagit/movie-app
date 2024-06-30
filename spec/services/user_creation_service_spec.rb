require 'rails_helper'

RSpec.describe UserCreationService, type: :service do
  let(:service) { UserCreationService.new(name) }
  describe "no name provided" do
    let(:name) { nil }
    it { expect {service.create}.to raise_error(UserCreationService::NoNameProvided) }
  end

  describe "name provided" do
    let(:name) { Faker::Name.name }
    it { expect { service.create }.to change(User, :count).by(1) }
    it { expect(service.create).to eq(User.last) }
  end
end
