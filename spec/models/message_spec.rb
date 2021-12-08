require 'rails_helper'

RSpec.describe Message, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:sender_user) }

    it { should belong_to(:listing) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
