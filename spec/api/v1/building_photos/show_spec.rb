require "rails_helper"

RSpec.describe "building_photos#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/building_photos/#{building_photo.id}", params: params
  end

  describe "basic fetch" do
    let!(:building_photo) { create(:building_photo) }

    it "works" do
      expect(BuildingPhotoResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("building_photos")
      expect(d.id).to eq(building_photo.id)
    end
  end
end
