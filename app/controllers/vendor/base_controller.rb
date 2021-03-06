class Vendor::BaseController < ApplicationController
  before_action :authenticate_vendor!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :photo, :category, :phone_number, :description, :address, :city])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :photo, :category, :phone_number, :description, :address, :city])
  end



    private

    def pundit_user
      # https://github.com/varvet/pundit/blob/df96d2ae6bcf28991c1501d5ff0bde4c42aa4acd/lib/pundit.rb#L317-L319

      # by default this will be `current_user`
      # we need to override it because this controller is for vendors

      current_vendor
    end
end
