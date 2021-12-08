class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  # GET /buildings
  def index
    @q = Building.ransack(params[:q])
    @buildings = @q.result(:distinct => true).includes(:building_photos, :building_amenities, :listings, :amenities).page(params[:page]).per(10)
  end

  # GET /buildings/1
  def show
    @listing = Listing.new
    @building_amenity = BuildingAmenity.new
    @building_photo = BuildingPhoto.new
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to @building, notice: 'Building was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /buildings/1
  def update
    if @building.update(building_params)
      redirect_to @building, notice: 'Building was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /buildings/1
  def destroy
    @building.destroy
    redirect_to buildings_url, notice: 'Building was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def building_params
      params.require(:building).permit(:name, :location, :building_type, :average_user_rating, :neighborhood)
    end
end
