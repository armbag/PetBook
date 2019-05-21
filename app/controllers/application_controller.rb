class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: :home
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :avatar, :avatar_cache])
  end
end
