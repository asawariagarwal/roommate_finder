class AmenitiesController < ApplicationController
  before_action :set_amenity, only: [:show, :edit, :update, :destroy]

  # GET /amenities
  def index
    @q = Amenity.ransack(params[:q])
    @amenities = @q.result(:distinct => true).includes(:building_amenities, :amenity_preferences, :user_preferences, :buildings).page(params[:page]).per(10)
  end

  # GET /amenities/1
  def show
    @amenity_preference = AmenityPreference.new
    @building_amenity = BuildingAmenity.new
  end

  # GET /amenities/new
  def new
    @amenity = Amenity.new
  end

  # GET /amenities/1/edit
  def edit
  end

  # POST /amenities
  def create
    @amenity = Amenity.new(amenity_params)

    if @amenity.save
      redirect_to @amenity, notice: 'Amenity was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /amenities/1
  def update
    if @amenity.update(amenity_params)
      redirect_to @amenity, notice: 'Amenity was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /amenities/1
  def destroy
    @amenity.destroy
    redirect_to amenities_url, notice: 'Amenity was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amenity
      @amenity = Amenity.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def amenity_params
      params.require(:amenity).permit(:name, :category)
    end
end
