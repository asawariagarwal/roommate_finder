require 'rails_helper'

RSpec.describe "listing_photos#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/listing_photos/#{listing_photo.id}", params: params
  end

  describe 'basic fetch' do
    let!(:listing_photo) { create(:listing_photo) }

    it 'works' do
      expect(ListingPhotoResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('listing_photos')
      expect(d.id).to eq(listing_photo.id)
    end
  end
end
