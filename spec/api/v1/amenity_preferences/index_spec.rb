require "rails_helper"

RSpec.describe "amenity_preferences#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/amenity_preferences", params: params
  end

  describe "basic fetch" do
    let!(:amenity_preference1) { create(:amenity_preference) }
    let!(:amenity_preference2) { create(:amenity_preference) }

    it "works" do
      expect(AmenityPreferenceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["amenity_preferences"])
      expect(d.map(&:id)).to match_array([amenity_preference1.id,
                                          amenity_preference2.id])
    end
  end
end
