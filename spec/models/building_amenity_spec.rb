require "rails_helper"

RSpec.describe BuildingAmenity, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:amenity) }

    it { should belong_to(:building) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
