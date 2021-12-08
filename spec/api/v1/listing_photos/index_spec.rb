require "rails_helper"

RSpec.describe "listing_photos#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/listing_photos", params: params
  end

  describe "basic fetch" do
    let!(:listing_photo1) { create(:listing_photo) }
    let!(:listing_photo2) { create(:listing_photo) }

    it "works" do
      expect(ListingPhotoResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["listing_photos"])
      expect(d.map(&:id)).to match_array([listing_photo1.id, listing_photo2.id])
    end
  end
end
