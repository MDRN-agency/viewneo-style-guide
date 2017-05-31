class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    @user = current_user.clone
  end

  def update
    @user = current_user.clone
    if @user.update_attributes(update_profile_params)
      bypass_sign_in(@user)
      redirect_to profile_path, notice: 'Your profile has been updated successfully'
    else
      render :edit
    end
  end

  private

  def update_profile_params
    basic_params = %i(first_name last_name photo)
    prms = params.require(:user)
    if prms[:password].present?
      prms.permit(basic_params + %i(password password_confirmation))
    else
      prms.permit(basic_params)
    end
  end
end
