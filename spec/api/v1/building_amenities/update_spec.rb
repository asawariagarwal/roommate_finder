require "rails_helper"

RSpec.describe "building_amenities#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/building_amenities/#{building_amenity.id}", payload
  end

  describe "basic update" do
    let!(:building_amenity) { create(:building_amenity) }

    let(:payload) do
      {
        data: {
          id: building_amenity.id.to_s,
          type: "building_amenities",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BuildingAmenityResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { building_amenity.reload.attributes }
    end
  end
end
