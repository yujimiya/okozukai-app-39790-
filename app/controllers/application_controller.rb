class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"] #環境変数の読み込み
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :role_id, :goal_price, :unit_price, :child_nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :role_id, :goal_price, :unit_price, :child_nickname])
  end
end

