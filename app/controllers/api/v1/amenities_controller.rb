class Api::V1::AmenitiesController < Api::V1::GraphitiController
  def index
    amenities = AmenityResource.all(params)
    respond_with(amenities)
  end

  def show
    amenity = AmenityResource.find(params)
    respond_with(amenity)
  end

  def create
    amenity = AmenityResource.build(params)

    if amenity.save
      render jsonapi: amenity, status: 201
    else
      render jsonapi_errors: amenity
    end
  end

  def update
    amenity = AmenityResource.find(params)

    if amenity.update_attributes
      render jsonapi: amenity
    else
      render jsonapi_errors: amenity
    end
  end

  def destroy
    amenity = AmenityResource.find(params)

    if amenity.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: amenity
    end
  end
end
