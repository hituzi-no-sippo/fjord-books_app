# frozen_string_literal: true

class UserProfilesController < ApplicationController
  before_action :set_login_user_profile, only: %i[edit update]

  def new
    @profile = UserProfile.new
  end

  def edit; end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to edit_user_profile_path, notice: t('controllers.common.notice_create', name: UserProfile.model_name.human)
    else
      render :new
    end
  end

  def update
    if @profile.update(profile_params)
      redirect_to edit_user_profile_path, notice: t('controllers.common.notice_update', name: UserProfile.model_name.human)
    else
      render :edit
    end
  end

  private

  def set_login_user_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:user_profile).permit(:postal_code, :address, :bio)
  end
end
