class BuildingAmenitiesController < ApplicationController
  before_action :set_building_amenity, only: %i[show edit update destroy]

  def index
    @q = BuildingAmenity.ransack(params[:q])
    @building_amenities = @q.result(distinct: true).includes(:building,
                                                             :amenity).page(params[:page]).per(10)
  end

  def show; end

  def new
    @building_amenity = BuildingAmenity.new
  end

  def edit; end

  def create
    @building_amenity = BuildingAmenity.new(building_amenity_params)

    if @building_amenity.save
      message = "BuildingAmenity was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @building_amenity, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @building_amenity.update(building_amenity_params)
      redirect_to @building_amenity,
                  notice: "Building amenity was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @building_amenity.destroy
    message = "BuildingAmenity was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to building_amenities_url, notice: message
    end
  end

  private

  def set_building_amenity
    @building_amenity = BuildingAmenity.find(params[:id])
  end

  def building_amenity_params
    params.require(:building_amenity).permit(:building_id, :amenity_id)
  end
end
