require "rails_helper"

RSpec.describe "building_amenities#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/building_amenities", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "building_amenities",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(BuildingAmenityResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { BuildingAmenity.count }.by(1)
    end
  end
end
