require 'rails_helper'

RSpec.describe "building_amenities#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/building_amenities", params: params
  end

  describe 'basic fetch' do
    let!(:building_amenity1) { create(:building_amenity) }
    let!(:building_amenity2) { create(:building_amenity) }

    it 'works' do
      expect(BuildingAmenityResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['building_amenities'])
      expect(d.map(&:id)).to match_array([building_amenity1.id, building_amenity2.id])
    end
  end
end
