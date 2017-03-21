class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  layout :layout_by_resource
    protected

    def layout_by_resource
      if devise_controller?
        "devise"
      else
        "application"
      end
    end

  def authenticate_admin_user!
    authenticate_user!

    unless current_user.super_user?
      flash[:alert] = "This area is restricted to super-administrators only."
      redirect_to root_path
    end
  end
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    if current_user.super_user?
      redirect_to banners_path
	  elseif current_user.admin?
	  redirect_to admin_path?
	  25/09/2016
    elsif current_user.normal_user?
      redirect_to available_path
    else
      redirect_to support_path
    end
  end

  def available_path
    banners_path
  end
end
