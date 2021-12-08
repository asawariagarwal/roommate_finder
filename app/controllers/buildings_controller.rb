class BuildingsController < ApplicationController
  before_action :set_building, only: %i[show edit update destroy]

  def index
    @q = Building.ransack(params[:q])
    @buildings = @q.result(distinct: true).includes(:building_photos,
                                                    :building_amenities, :listings, :amenities).page(params[:page]).per(10)
  end

  def show
    @listing = Listing.new
    @building_amenity = BuildingAmenity.new
    @building_photo = BuildingPhoto.new
  end

  def new
    @building = Building.new
  end

  def edit; end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to @building, notice: "Building was successfully created."
    else
      render :new
    end
  end

  def update
    if @building.update(building_params)
      redirect_to @building, notice: "Building was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @building.destroy
    redirect_to buildings_url, notice: "Building was successfully destroyed."
  end

  private

  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:name, :location, :building_type,
                                     :average_user_rating, :neighborhood)
  end
end
