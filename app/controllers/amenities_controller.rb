class AmenitiesController < ApplicationController
  before_action :set_amenity, only: %i[show edit update destroy]

  def index
    @q = Amenity.ransack(params[:q])
    @amenities = @q.result(distinct: true).includes(:building_amenities,
                                                    :amenity_preferences, :user_preferences, :buildings).page(params[:page]).per(10)
  end

  def show
    @amenity_preference = AmenityPreference.new
    @building_amenity = BuildingAmenity.new
  end

  def new
    @amenity = Amenity.new
  end

  def edit; end

  def create
    @amenity = Amenity.new(amenity_params)

    if @amenity.save
      redirect_to @amenity, notice: "Amenity was successfully created."
    else
      render :new
    end
  end

  def update
    if @amenity.update(amenity_params)
      redirect_to @amenity, notice: "Amenity was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @amenity.destroy
    redirect_to amenities_url, notice: "Amenity was successfully destroyed."
  end

  private

  def set_amenity
    @amenity = Amenity.find(params[:id])
  end

  def amenity_params
    params.require(:amenity).permit(:name, :category)
  end
end
