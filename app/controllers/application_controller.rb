class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:first_name, :last_name, :mobile_no]
    )

    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:first_name, :last_name, :mobile_no]
    )
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
