class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :welcome]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname])

  end


  def home
  end

  def welcome
  end
end
