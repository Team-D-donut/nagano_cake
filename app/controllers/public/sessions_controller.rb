# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :reject_customer, only: [:create]

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

  protected
# 退会しているかを判断するメソッド
  def reject_customer
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to new_customer_session_path
      end
    else
      flash[:error] = "必須項目を入力して下さい。"
    end
  end
end

