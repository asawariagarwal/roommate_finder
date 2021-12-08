require 'rails_helper'

RSpec.describe Amenity, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:amenity_preferences) }

    it { should have_many(:building_amenities) }

    end

    describe "InDirect Associations" do

    it { should have_many(:user_preferences) }

    end

    describe "Validations" do

    end
end
