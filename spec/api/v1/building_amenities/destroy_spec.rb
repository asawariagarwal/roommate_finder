require "rails_helper"

RSpec.describe "building_amenities#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/building_amenities/#{building_amenity.id}"
  end

  describe "basic destroy" do
    let!(:building_amenity) { create(:building_amenity) }

    it "updates the resource" do
      expect(BuildingAmenityResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { BuildingAmenity.count }.by(-1)
      expect { building_amenity.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
