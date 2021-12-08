require 'rails_helper'

RSpec.describe "amenity_preferences#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/amenity_preferences/#{amenity_preference.id}"
  end

  describe 'basic destroy' do
    let!(:amenity_preference) { create(:amenity_preference) }

    it 'updates the resource' do
      expect(AmenityPreferenceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { AmenityPreference.count }.by(-1)
      expect { amenity_preference.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
