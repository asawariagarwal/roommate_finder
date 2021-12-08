require 'rails_helper'

RSpec.describe AmenityPreferenceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'amenity_preferences',
          attributes: { }
        }
      }
    end

    let(:instance) do
      AmenityPreferenceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { AmenityPreference.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:amenity_preference) { create(:amenity_preference) }

    let(:payload) do
      {
        data: {
          id: amenity_preference.id.to_s,
          type: 'amenity_preferences',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      AmenityPreferenceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { amenity_preference.reload.updated_at }
      # .and change { amenity_preference.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:amenity_preference) { create(:amenity_preference) }

    let(:instance) do
      AmenityPreferenceResource.find(id: amenity_preference.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { AmenityPreference.count }.by(-1)
    end
  end
end
