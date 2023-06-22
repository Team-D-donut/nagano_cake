class Public::AddressesController < ApplicationController
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
      if @address.save
        flash[:notice] = "You have created address successfully."
      redirect_to addresses_path
      #else
      #@customer = current_customer
      #@addresses = Address.all
      #render :index
      end
  end
  
  def index
    @addresses = Address.all
    @address= Address.new
    @customer = current_customer
  end

  def edit
    @address = Address.find(params[:id])
  end


  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if @address.save
      flash[:notice] = "You have updated book successfully."
      redirect_to address_path(@address.id)
    else
      @addresses = Address.all
      render :edit
    end
  end

  def destroy
    address = Address.find(params[:id])  # データ（レコード）を1件取得
    address.destroy  # データ（レコード）を削除
    redirect_to '/addresses'  # 配送先一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def address_params
    params.require(:address).permit(:post_code, :address, :name)
  end
end