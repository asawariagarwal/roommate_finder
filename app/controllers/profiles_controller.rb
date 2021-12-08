class ProfilesController < ApplicationController
  before_action :current_user_must_be_profile_user,
                only: %i[edit update destroy]

  before_action :set_profile, only: %i[show edit update destroy]

  def index
    @q = Profile.ransack(params[:q])
    @profiles = @q.result(distinct: true).includes(:user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @profile = Profile.new
  end

  def edit; end

  def create
    @profile = Profile.new(profile_params)

    if @profile.save
      message = "Profile was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @profile, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Profile was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    message = "Profile was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to profiles_url, notice: message
    end
  end

  private

  def current_user_must_be_profile_user
    set_profile
    unless current_user == @profile.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:user_id, :first_name, :last_name,
                                    :gender, :age, :occupation, :current_city, :pet_owner, :pet_description, :about_me)
  end
end
