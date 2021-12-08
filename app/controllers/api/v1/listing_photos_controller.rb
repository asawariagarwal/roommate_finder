class Api::V1::ListingPhotosController < Api::V1::GraphitiController
  def index
    listing_photos = ListingPhotoResource.all(params)
    respond_with(listing_photos)
  end

  def show
    listing_photo = ListingPhotoResource.find(params)
    respond_with(listing_photo)
  end

  def create
    listing_photo = ListingPhotoResource.build(params)

    if listing_photo.save
      render jsonapi: listing_photo, status: 201
    else
      render jsonapi_errors: listing_photo
    end
  end

  def update
    listing_photo = ListingPhotoResource.find(params)

    if listing_photo.update_attributes
      render jsonapi: listing_photo
    else
      render jsonapi_errors: listing_photo
    end
  end

  def destroy
    listing_photo = ListingPhotoResource.find(params)

    if listing_photo.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: listing_photo
    end
  end
end
