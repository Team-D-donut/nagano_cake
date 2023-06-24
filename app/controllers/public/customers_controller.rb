class Public::CustomersController < ApplicationController


  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def confirm
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:info] = "会員登録情報の編集が完了しました!"
      redirect_to current_customer_customers_path
    else
      render :edit
    end
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    # 退会フラグを立てる
    @customer.update(is_deleted: true)
    # ログアウトさせる
    reset_session
    redirect_to root_path, notice: "退会処理を実行しました。またのご利用を心よりお待ちしております。"
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :post_code, :address, :telephone_number, :email)
  end

end
