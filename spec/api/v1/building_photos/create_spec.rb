require 'rails_helper'

RSpec.describe "building_photos#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/building_photos", payload
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
          type: 'building_photos',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(BuildingPhotoResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { BuildingPhoto.count }.by(1)
    end
  end
end
