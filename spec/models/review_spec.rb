require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:reviewable) }
  end

  describe "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:reviewable) }
  end
end
