class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

 # new 画面から渡ってきたデータをユーザーに確認してもらいます
  def confirm
    @order = Order.new(order_params)
      if params[:order][:address_option] == "0"
        @order.post_code = current_customer.post_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:address_option] == "1"
        @address = Address.find(params[:order][:address_id])
        @order.post_code = @address.post_code
        @order.address = @address.address
        @order.name = @address.name
      elsif params[:order][:address_option] == "2"
        @order.post_code = params[:order][:post_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
      else
          render 'new'
      end
        @cart_items = current_customer.cart_items.all
        @order.customer_id = current_customer.id
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    # ordered_itmemの保存
    current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
      @ordered_item = OrderedItem.new #初期化宣言
      @ordered_item.item_id = cart_item.item_id #商品idを注文商品idに代入
      @ordered_item.quantity = cart_item.quantity #商品の個数を注文商品の個数に代入
      @ordered_item.purchase_price = (cart_item.item.price*1.08).floor #消費税込みに計算して代入
      @ordered_item.order_id =  @order.id #注文商品に注文idを紐付け
      @ordered_item.save #注文商品を保存
    end #ループ終わり

    current_customer.cart_items.destroy_all #カートの中身を削除
    redirect_to '/orders/complete'
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
  end


private

  def order_params
  params.require(:order).permit(:postage, :payment, :name, :address, :post_code , :customer_id, :total_price, :status)
  end

  def address_params
  params.require(:order).permit(:postage, :payment, :name, :address, :post_code , :customer_id, :total_price, :status)
  end
end