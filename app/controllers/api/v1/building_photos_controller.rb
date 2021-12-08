class Api::V1::BuildingPhotosController < Api::V1::GraphitiController
  def index
    building_photos = BuildingPhotoResource.all(params)
    respond_with(building_photos)
  end

  def show
    building_photo = BuildingPhotoResource.find(params)
    respond_with(building_photo)
  end

  def create
    building_photo = BuildingPhotoResource.build(params)

    if building_photo.save
      render jsonapi: building_photo, status: 201
    else
      render jsonapi_errors: building_photo
    end
  end

  def update
    building_photo = BuildingPhotoResource.find(params)

    if building_photo.update_attributes
      render jsonapi: building_photo
    else
      render jsonapi_errors: building_photo
    end
  end

  def destroy
    building_photo = BuildingPhotoResource.find(params)

    if building_photo.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: building_photo
    end
  end
end
