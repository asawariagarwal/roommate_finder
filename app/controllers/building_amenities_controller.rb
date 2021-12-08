class BuildingAmenitiesController < ApplicationController
  before_action :set_building_amenity, only: [:show, :edit, :update, :destroy]

  # GET /building_amenities
  def index
    @q = BuildingAmenity.ransack(params[:q])
    @building_amenities = @q.result(:distinct => true).includes(:building, :amenity).page(params[:page]).per(10)
  end

  # GET /building_amenities/1
  def show
  end

  # GET /building_amenities/new
  def new
    @building_amenity = BuildingAmenity.new
  end

  # GET /building_amenities/1/edit
  def edit
  end

  # POST /building_amenities
  def create
    @building_amenity = BuildingAmenity.new(building_amenity_params)

    if @building_amenity.save
      message = 'BuildingAmenity was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @building_amenity, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /building_amenities/1
  def update
    if @building_amenity.update(building_amenity_params)
      redirect_to @building_amenity, notice: 'Building amenity was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /building_amenities/1
  def destroy
    @building_amenity.destroy
    message = "BuildingAmenity was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to building_amenities_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building_amenity
      @building_amenity = BuildingAmenity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def building_amenity_params
      params.require(:building_amenity).permit(:building_id, :amenity_id)
    end
end
