require "rails_helper"

RSpec.describe BuildingPhotoResource, type: :resource do
  describe "serialization" do
    let!(:building_photo) { create(:building_photo) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(building_photo.id)
      expect(data.jsonapi_type).to eq("building_photos")
    end
  end

  describe "filtering" do
    let!(:building_photo1) { create(:building_photo) }
    let!(:building_photo2) { create(:building_photo) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: building_photo2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([building_photo2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:building_photo1) { create(:building_photo) }
      let!(:building_photo2) { create(:building_photo) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      building_photo1.id,
                                      building_photo2.id,
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
                                      building_photo2.id,
                                      building_photo1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
