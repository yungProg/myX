class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile successfully created"
      redirect_to profiles_path(@profile)
    else
      flash[:error] = "Something went wrong"
      render "new", status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.expect(profile: [ :location, :date_of_birth, :avatar ])
  end
end
