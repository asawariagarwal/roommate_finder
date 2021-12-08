require "rails_helper"

RSpec.describe Preference, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }

    it { should have_many(:amenity_preferences) }
  end

  describe "InDirect Associations" do
    it { should have_many(:amenities) }
  end

  describe "Validations" do
  end
end
