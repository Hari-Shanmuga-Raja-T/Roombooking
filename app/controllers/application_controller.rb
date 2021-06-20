class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :hotelname , :email , :password, :phno , :address, :firstname,:lastname,:mode )}
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit( :hotelname , :email , :password , :current_password , :phno , :address, :firstname,:lastname,:mode )}
  end
end
