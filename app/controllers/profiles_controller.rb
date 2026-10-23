class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    profile = Profile.new(message: params[:profile][:message])
    profile.user = current_user
    profile.save

    redirect_to root_path
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    profile = Profile.find(params[:id])
    profile.message = params[:profile][:message]
    profile.save

    redirect_to root_path
  end
end