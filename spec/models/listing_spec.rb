require "rails_helper"

RSpec.describe Listing, type: :model do
  describe "Direct Associations" do
    it { should have_many(:messages) }

    it { should have_many(:listing_photos) }

    it { should have_many(:favorites) }

    it { should belong_to(:building) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
