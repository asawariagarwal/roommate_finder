require 'rails_helper'

RSpec.describe "amenity_preferences#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/amenity_preferences", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'amenity_preferences',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(AmenityPreferenceResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { AmenityPreference.count }.by(1)
    end
  end
end
