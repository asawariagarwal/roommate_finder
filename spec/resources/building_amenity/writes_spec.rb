require 'rails_helper'

RSpec.describe BuildingAmenityResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'building_amenities',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BuildingAmenityResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BuildingAmenity.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:building_amenity) { create(:building_amenity) }

    let(:payload) do
      {
        data: {
          id: building_amenity.id.to_s,
          type: 'building_amenities',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BuildingAmenityResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { building_amenity.reload.updated_at }
      # .and change { building_amenity.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:building_amenity) { create(:building_amenity) }

    let(:instance) do
      BuildingAmenityResource.find(id: building_amenity.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BuildingAmenity.count }.by(-1)
    end
  end
end
