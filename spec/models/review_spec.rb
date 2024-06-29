require 'rails_helper'

RSpec.describe Review, type: :model do
  describe "validations" do
    context "presence" do
      it { should validate_presence_of(:rating) }
      it { should validate_presence_of(:user) }
      it { should validate_presence_of(:reviewable) }
    end

    context "uniqueness" do
      before do
        create(:review, reviewable: create(:movie), user: create(:user))
      end

      it { should validate_uniqueness_of(:reviewable_id).scoped_to(:user_id) }
    end
  end

  describe "relations" do
    it { should belong_to(:user) }
    it { should belong_to(:reviewable) }
  end
end
