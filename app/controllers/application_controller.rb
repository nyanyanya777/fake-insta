class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  PERMISSIBLE_ATTRIBUTES = %i(name)
  protect_from_forgery with: :exception
  protected

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: PERMISSIBLE_ATTRIBUTES)
     devise_parameter_sanitizer.permit(:account_update, keys: PERMISSIBLE_ATTRIBUTES)
   end
end