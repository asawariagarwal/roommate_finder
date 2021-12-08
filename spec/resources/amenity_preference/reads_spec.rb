require "rails_helper"

RSpec.describe AmenityPreferenceResource, type: :resource do
  describe "serialization" do
    let!(:amenity_preference) { create(:amenity_preference) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(amenity_preference.id)
      expect(data.jsonapi_type).to eq("amenity_preferences")
    end
  end

  describe "filtering" do
    let!(:amenity_preference1) { create(:amenity_preference) }
    let!(:amenity_preference2) { create(:amenity_preference) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: amenity_preference2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([amenity_preference2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:amenity_preference1) { create(:amenity_preference) }
      let!(:amenity_preference2) { create(:amenity_preference) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      amenity_preference1.id,
                                      amenity_preference2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      amenity_preference2.id,
                                      amenity_preference1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
