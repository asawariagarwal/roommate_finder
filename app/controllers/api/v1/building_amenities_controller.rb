class Api::V1::BuildingAmenitiesController < Api::V1::GraphitiController
  def index
    building_amenities = BuildingAmenityResource.all(params)
    respond_with(building_amenities)
  end

  def show
    building_amenity = BuildingAmenityResource.find(params)
    respond_with(building_amenity)
  end

  def create
    building_amenity = BuildingAmenityResource.build(params)

    if building_amenity.save
      render jsonapi: building_amenity, status: 201
    else
      render jsonapi_errors: building_amenity
    end
  end

  def update
    building_amenity = BuildingAmenityResource.find(params)

    if building_amenity.update_attributes
      render jsonapi: building_amenity
    else
      render jsonapi_errors: building_amenity
    end
  end

  def destroy
    building_amenity = BuildingAmenityResource.find(params)

    if building_amenity.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: building_amenity
    end
  end
end
