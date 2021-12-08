require "rails_helper"

RSpec.describe "listing_photos#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/listing_photos/#{listing_photo.id}", payload
  end

  describe "basic update" do
    let!(:listing_photo) { create(:listing_photo) }

    let(:payload) do
      {
        data: {
          id: listing_photo.id.to_s,
          type: "listing_photos",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ListingPhotoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { listing_photo.reload.attributes }
    end
  end
end
