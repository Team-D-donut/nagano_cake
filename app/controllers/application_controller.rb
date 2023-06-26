class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :info, :danger

  protected

  def after_sign_in_path_for(resource)
    current_customer_customers_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :first_name, :last_name, :kana_first_name, :kana_last_name, :post_code, :address, :telephone_number ])
  end
end
