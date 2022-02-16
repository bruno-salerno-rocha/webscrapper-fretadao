class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy rescan]

  # GET /profiles
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
  end

  # POST /profiles
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if profile_params.present? && @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  def update
    respond_to do |format|
      if profile_params.present? && @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
    end
  end

  # POST /profiles/1/rescan
  def rescan
    @profile.scrape_attributes

    if @profile.save
      message = "Profile was successfully updated."
    else
      message = "Couldn't update profile."
    end

    respond_to do |format|
      format.html { redirect_to profile_url(@profile), notice: message }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :github_url)
    end
end
