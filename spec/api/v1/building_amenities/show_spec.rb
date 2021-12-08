require 'rails_helper'

RSpec.describe "building_amenities#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/building_amenities/#{building_amenity.id}", params: params
  end

  describe 'basic fetch' do
    let!(:building_amenity) { create(:building_amenity) }

    it 'works' do
      expect(BuildingAmenityResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('building_amenities')
      expect(d.id).to eq(building_amenity.id)
    end
  end
end
