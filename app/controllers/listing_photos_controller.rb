class ListingPhotosController < ApplicationController
  before_action :set_listing_photo, only: %i[show edit update destroy]

  def index
    @q = ListingPhoto.ransack(params[:q])
    @listing_photos = @q.result(distinct: true).includes(:listing).page(params[:page]).per(10)
  end

  def show; end

  def new
    @listing_photo = ListingPhoto.new
  end

  def edit; end

  def create
    @listing_photo = ListingPhoto.new(listing_photo_params)

    if @listing_photo.save
      message = "ListingPhoto was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @listing_photo, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @listing_photo.update(listing_photo_params)
      redirect_to @listing_photo,
                  notice: "Listing photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @listing_photo.destroy
    message = "ListingPhoto was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to listing_photos_url, notice: message
    end
  end

  private

  def set_listing_photo
    @listing_photo = ListingPhoto.find(params[:id])
  end

  def listing_photo_params
    params.require(:listing_photo).permit(:listing_id, :photo, :caption)
  end
end
