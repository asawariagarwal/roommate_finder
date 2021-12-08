class BuildingAmenitiesController < ApplicationController
  before_action :set_building_amenity, only: [:show, :edit, :update, :destroy]

  # GET /building_amenities
  def index
    @building_amenities = BuildingAmenity.all
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
      redirect_to @building_amenity, notice: 'Building amenity was successfully created.'
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
    redirect_to building_amenities_url, notice: 'Building amenity was successfully destroyed.'
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
