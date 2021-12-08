class Api::V1::AmenityPreferencesController < Api::V1::GraphitiController
  def index
    amenity_preferences = AmenityPreferenceResource.all(params)
    respond_with(amenity_preferences)
  end

  def show
    amenity_preference = AmenityPreferenceResource.find(params)
    respond_with(amenity_preference)
  end

  def create
    amenity_preference = AmenityPreferenceResource.build(params)

    if amenity_preference.save
      render jsonapi: amenity_preference, status: :created
    else
      render jsonapi_errors: amenity_preference
    end
  end

  def update
    amenity_preference = AmenityPreferenceResource.find(params)

    if amenity_preference.update_attributes
      render jsonapi: amenity_preference
    else
      render jsonapi_errors: amenity_preference
    end
  end

  def destroy
    amenity_preference = AmenityPreferenceResource.find(params)

    if amenity_preference.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: amenity_preference
    end
  end
end
