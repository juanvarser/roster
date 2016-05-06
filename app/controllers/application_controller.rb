class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :clear_xhr_flash

  private
  def clear_xhr_flash
    if request.xhr?
      flash.discard
    end
  end

  def authorize_user
    unless current_user
      flash[:message] = 'Please log in'
      redirect_to new_user_session_path
    end
  end

  def after_sign_in_path_for(_resource)
    user_bands_path user_id: current_user.id
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
