require 'rails_helper'

RSpec.describe ListingPhotoResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'listing_photos',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ListingPhotoResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ListingPhoto.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:listing_photo) { create(:listing_photo) }

    let(:payload) do
      {
        data: {
          id: listing_photo.id.to_s,
          type: 'listing_photos',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ListingPhotoResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { listing_photo.reload.updated_at }
      # .and change { listing_photo.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:listing_photo) { create(:listing_photo) }

    let(:instance) do
      ListingPhotoResource.find(id: listing_photo.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ListingPhoto.count }.by(-1)
    end
  end
end
