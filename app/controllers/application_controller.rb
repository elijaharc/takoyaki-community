# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def cities
    render json: CS.cities(params[:state], :ph).to_json
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :region, :city, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :region, :city, :email, :password, :current_password)
    end
  end

  def after_sign_in_path_for(resource)
    if resource.from_facebook == true && resource.region.nil? && resource.city.nil?
      # temp redirect path
      seller_pages_path
    else
      root_path
    end
  end

  def auth_region
    if user_signed_in?
      if current_user.region.nil? || current_user.city.nil?
        redirect_to edit_profile_path
      end
    end
  end

  def force_otp
    if user_signed_in?
      if !current_user.seller_page.verified? 
        redirect_to seller_page_otp_verification_path(current_user.seller_page.id)
      end
    end
  end
end
