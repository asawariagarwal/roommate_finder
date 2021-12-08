require 'rails_helper'

RSpec.describe "amenity_preferences#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/amenity_preferences/#{amenity_preference.id}", params: params
  end

  describe 'basic fetch' do
    let!(:amenity_preference) { create(:amenity_preference) }

    it 'works' do
      expect(AmenityPreferenceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('amenity_preferences')
      expect(d.id).to eq(amenity_preference.id)
    end
  end
end
