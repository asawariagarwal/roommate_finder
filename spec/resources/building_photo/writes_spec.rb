require "rails_helper"

RSpec.describe BuildingPhotoResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "building_photos",
          attributes: {},
        },
      }
    end

    let(:instance) do
      BuildingPhotoResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { BuildingPhoto.count }.by(1)
    end
  end

  describe "updating" do
    let!(:building_photo) { create(:building_photo) }

    let(:payload) do
      {
        data: {
          id: building_photo.id.to_s,
          type: "building_photos",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      BuildingPhotoResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { building_photo.reload.updated_at }
      # .and change { building_photo.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:building_photo) { create(:building_photo) }

    let(:instance) do
      BuildingPhotoResource.find(id: building_photo.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { BuildingPhoto.count }.by(-1)
    end
  end
end
