class BuildingPhotosController < ApplicationController
  before_action :set_building_photo, only: [:show, :edit, :update, :destroy]

  # GET /building_photos
  def index
    @building_photos = BuildingPhoto.all
  end

  # GET /building_photos/1
  def show
  end

  # GET /building_photos/new
  def new
    @building_photo = BuildingPhoto.new
  end

  # GET /building_photos/1/edit
  def edit
  end

  # POST /building_photos
  def create
    @building_photo = BuildingPhoto.new(building_photo_params)

    if @building_photo.save
      message = 'BuildingPhoto was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @building_photo, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /building_photos/1
  def update
    if @building_photo.update(building_photo_params)
      redirect_to @building_photo, notice: 'Building photo was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /building_photos/1
  def destroy
    @building_photo.destroy
    message = "BuildingPhoto was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to building_photos_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_photo
      @building_photo = BuildingPhoto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def building_photo_params
      params.require(:building_photo).permit(:building_id, :photo, :caption)
    end
end
