class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :name, :category, :phone_number, :description, :address, :city])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username,:first_name, :last_name, :photo, :name, :category, :phone_number, :description, :address, :city])
  end
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
