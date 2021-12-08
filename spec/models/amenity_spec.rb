require 'rails_helper'

RSpec.describe Amenity, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:building_amenities) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
