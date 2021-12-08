require "rails_helper"

RSpec.describe Favorite, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }

    it { should belong_to(:listing) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
