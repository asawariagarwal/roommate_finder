require "rails_helper"

RSpec.describe BuildingAmenityResource, type: :resource do
  describe "serialization" do
    let!(:building_amenity) { create(:building_amenity) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(building_amenity.id)
      expect(data.jsonapi_type).to eq("building_amenities")
    end
  end

  describe "filtering" do
    let!(:building_amenity1) { create(:building_amenity) }
    let!(:building_amenity2) { create(:building_amenity) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: building_amenity2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([building_amenity2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:building_amenity1) { create(:building_amenity) }
      let!(:building_amenity2) { create(:building_amenity) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      building_amenity1.id,
                                      building_amenity2.id,
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
                                      building_amenity2.id,
                                      building_amenity1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
