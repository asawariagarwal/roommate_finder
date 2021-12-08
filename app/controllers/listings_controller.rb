class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  def index
    @q = Listing.ransack(params[:q])
    @listings = @q.result(distinct: true).includes(:building, :favorites,
                                                   :listing_photos, :messages).page(params[:page]).per(10)
  end

  def show
    @message = Message.new
    @listing_photo = ListingPhoto.new
    @favorite = Favorite.new
  end

  def new
    @listing = Listing.new
  end

  def edit; end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      message = "Listing was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @listing, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: "Listing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    message = "Listing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to listings_url, notice: message
    end
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:building_id, :unit_type, :lease_length,
                                    :price, :earliest_move_in, :floorplan)
  end
end
