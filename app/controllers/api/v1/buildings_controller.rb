class Api::V1::BuildingsController < Api::V1::GraphitiController
  def index
    buildings = BuildingResource.all(params)
    respond_with(buildings)
  end

  def show
    building = BuildingResource.find(params)
    respond_with(building)
  end

  def create
    building = BuildingResource.build(params)

    if building.save
      render jsonapi: building, status: 201
    else
      render jsonapi_errors: building
    end
  end

  def update
    building = BuildingResource.find(params)

    if building.update_attributes
      render jsonapi: building
    else
      render jsonapi_errors: building
    end
  end

  def destroy
    building = BuildingResource.find(params)

    if building.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: building
    end
  end
end
