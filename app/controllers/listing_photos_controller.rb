class ListingPhotosController < ApplicationController
  before_action :set_listing_photo, only: [:show, :edit, :update, :destroy]

  # GET /listing_photos
  def index
    @listing_photos = ListingPhoto.all
  end

  # GET /listing_photos/1
  def show
  end

  # GET /listing_photos/new
  def new
    @listing_photo = ListingPhoto.new
  end

  # GET /listing_photos/1/edit
  def edit
  end

  # POST /listing_photos
  def create
    @listing_photo = ListingPhoto.new(listing_photo_params)

    if @listing_photo.save
      redirect_to @listing_photo, notice: 'Listing photo was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /listing_photos/1
  def update
    if @listing_photo.update(listing_photo_params)
      redirect_to @listing_photo, notice: 'Listing photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /listing_photos/1
  def destroy
    @listing_photo.destroy
    message = "ListingPhoto was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to listing_photos_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_photo
      @listing_photo = ListingPhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_photo_params
      params.require(:listing_photo).permit(:listing_id, :photo, :caption)
    end
end
