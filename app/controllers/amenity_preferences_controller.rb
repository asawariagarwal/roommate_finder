class AmenityPreferencesController < ApplicationController
  before_action :set_amenity_preference, only: [:show, :edit, :update, :destroy]

  # GET /amenity_preferences
  def index
    @q = AmenityPreference.ransack(params[:q])
    @amenity_preferences = @q.result(:distinct => true).includes(:preference, :amenity).page(params[:page]).per(10)
  end

  # GET /amenity_preferences/1
  def show
  end

  # GET /amenity_preferences/new
  def new
    @amenity_preference = AmenityPreference.new
  end

  # GET /amenity_preferences/1/edit
  def edit
  end

  # POST /amenity_preferences
  def create
    @amenity_preference = AmenityPreference.new(amenity_preference_params)

    if @amenity_preference.save
      message = 'AmenityPreference was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @amenity_preference, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /amenity_preferences/1
  def update
    if @amenity_preference.update(amenity_preference_params)
      redirect_to @amenity_preference, notice: 'Amenity preference was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /amenity_preferences/1
  def destroy
    @amenity_preference.destroy
    message = "AmenityPreference was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to amenity_preferences_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amenity_preference
      @amenity_preference = AmenityPreference.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def amenity_preference_params
      params.require(:amenity_preference).permit(:amenity_id, :preference_id)
    end
end
