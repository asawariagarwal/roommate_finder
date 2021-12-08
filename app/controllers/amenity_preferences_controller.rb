class AmenityPreferencesController < ApplicationController
  before_action :set_amenity_preference, only: %i[show edit update destroy]

  def index
    @q = AmenityPreference.ransack(params[:q])
    @amenity_preferences = @q.result(distinct: true).includes(:preference,
                                                              :amenity).page(params[:page]).per(10)
  end

  def show; end

  def new
    @amenity_preference = AmenityPreference.new
  end

  def edit; end

  def create
    @amenity_preference = AmenityPreference.new(amenity_preference_params)

    if @amenity_preference.save
      message = "AmenityPreference was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @amenity_preference, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @amenity_preference.update(amenity_preference_params)
      redirect_to @amenity_preference,
                  notice: "Amenity preference was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @amenity_preference.destroy
    message = "AmenityPreference was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to amenity_preferences_url, notice: message
    end
  end

  private

  def set_amenity_preference
    @amenity_preference = AmenityPreference.find(params[:id])
  end

  def amenity_preference_params
    params.require(:amenity_preference).permit(:amenity_id, :preference_id)
  end
end
