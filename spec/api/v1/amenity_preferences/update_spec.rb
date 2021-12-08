require 'rails_helper'

RSpec.describe "amenity_preferences#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/amenity_preferences/#{amenity_preference.id}", payload
  end

  describe 'basic update' do
    let!(:amenity_preference) { create(:amenity_preference) }

    let(:payload) do
      {
        data: {
          id: amenity_preference.id.to_s,
          type: 'amenity_preferences',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AmenityPreferenceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { amenity_preference.reload.attributes }
    end
  end
end
