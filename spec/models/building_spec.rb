require 'rails_helper'

RSpec.describe Building, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:building_photos) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
