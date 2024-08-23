class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:password,:family_name_kanji,:first_name_kanji,:family_name_kana,:first_name_kana,:birthday])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|    
    username == "dog" && password == "1111"
    end
  end
end

#username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] 