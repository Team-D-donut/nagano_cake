# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController

protected

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  
end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end



  # If you have extra params to permit, append them to the sanitizer.

