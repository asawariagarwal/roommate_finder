require 'rails_helper'

RSpec.describe "building_photos#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/building_photos/#{building_photo.id}", payload
  end

  describe 'basic update' do
    let!(:building_photo) { create(:building_photo) }

    let(:payload) do
      {
        data: {
          id: building_photo.id.to_s,
          type: 'building_photos',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BuildingPhotoResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { building_photo.reload.attributes }
    end
  end
end
