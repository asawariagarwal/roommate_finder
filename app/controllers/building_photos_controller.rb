class BuildingPhotosController < ApplicationController
  before_action :set_building_photo, only: %i[show edit update destroy]

  def index
    @q = BuildingPhoto.ransack(params[:q])
    @building_photos = @q.result(distinct: true).includes(:building).page(params[:page]).per(10)
  end

  def show; end

  def new
    @building_photo = BuildingPhoto.new
  end

  def edit; end

  def create
    @building_photo = BuildingPhoto.new(building_photo_params)

    if @building_photo.save
      message = "BuildingPhoto was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @building_photo, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @building_photo.update(building_photo_params)
      redirect_to @building_photo,
                  notice: "Building photo was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @building_photo.destroy
    message = "BuildingPhoto was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to building_photos_url, notice: message
    end
  end

  private

  def set_building_photo
    @building_photo = BuildingPhoto.find(params[:id])
  end

  def building_photo_params
    params.require(:building_photo).permit(:building_id, :photo, :caption)
  end
end
