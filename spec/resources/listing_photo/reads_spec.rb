require "rails_helper"

RSpec.describe ListingPhotoResource, type: :resource do
  describe "serialization" do
    let!(:listing_photo) { create(:listing_photo) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(listing_photo.id)
      expect(data.jsonapi_type).to eq("listing_photos")
    end
  end

  describe "filtering" do
    let!(:listing_photo1) { create(:listing_photo) }
    let!(:listing_photo2) { create(:listing_photo) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: listing_photo2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([listing_photo2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:listing_photo1) { create(:listing_photo) }
      let!(:listing_photo2) { create(:listing_photo) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      listing_photo1.id,
                                      listing_photo2.id,
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
                                      listing_photo2.id,
                                      listing_photo1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
