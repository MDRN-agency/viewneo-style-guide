class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def callback_handle
    user = User.find_or_create_from_omniauth request.env['omniauth.auth']
    if user.persisted?
      sign_in_and_redirect(user)
    else
      flash[:alert] = 'Please supply more information to create your account'
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :callback_handle
  alias_method :linkedin, :callback_handle
  alias_method :twitter, :callback_handle
  alias_method :google_oauth2, :callback_handle
end
