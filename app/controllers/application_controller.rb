class ApplicationController < ActionController::Base

  skip_before_action :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?

  layout :application


  protected
  

  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}
     devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:name, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password])
  end

  def application
    if devise_controller?
      'application'
    else
      'application'
    end
  end

end
