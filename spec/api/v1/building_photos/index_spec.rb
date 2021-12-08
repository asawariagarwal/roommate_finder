require 'rails_helper'

RSpec.describe "building_photos#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/building_photos", params: params
  end

  describe 'basic fetch' do
    let!(:building_photo1) { create(:building_photo) }
    let!(:building_photo2) { create(:building_photo) }

    it 'works' do
      expect(BuildingPhotoResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['building_photos'])
      expect(d.map(&:id)).to match_array([building_photo1.id, building_photo2.id])
    end
  end
end
