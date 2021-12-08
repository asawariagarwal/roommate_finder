require 'rails_helper'

RSpec.describe "listing_photos#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/listing_photos/#{listing_photo.id}"
  end

  describe 'basic destroy' do
    let!(:listing_photo) { create(:listing_photo) }

    it 'updates the resource' do
      expect(ListingPhotoResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ListingPhoto.count }.by(-1)
      expect { listing_photo.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
