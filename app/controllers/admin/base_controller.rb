module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin

    protected

    def authenticate_admin
      unless current_user.is_admin?
        redirect_to root_url, alert: 'You dont have permission to access this page'
      end
    end
  end
end
