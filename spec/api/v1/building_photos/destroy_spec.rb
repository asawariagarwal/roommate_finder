require "rails_helper"

RSpec.describe "building_photos#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/building_photos/#{building_photo.id}"
  end

  describe "basic destroy" do
    let!(:building_photo) { create(:building_photo) }

    it "updates the resource" do
      expect(BuildingPhotoResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { BuildingPhoto.count }.by(-1)
      expect { building_photo.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
