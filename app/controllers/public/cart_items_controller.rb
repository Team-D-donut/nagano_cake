class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = current_customer.cart_items.all
    # カートに入ってる商品の合計金額
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
  
  def create
        @cart_item = current_customer.cart_items.new(cart_item_params)
        # もし元々カート内に「同じ商品」がある場合、「数量を追加」更新・保存する
        if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
            cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
            cart_item.quantity += params[:cart_item][:quantity].to_i
            cart_item.save
            redirect_to cart_items_path

        # もしカート内に「同じ」商品がない場合は通常の保存処理 
        elsif @cart_item.save
            　@cart_items = current_customer.cart_items.all
            　render 'index'
        else　# 保存できなかった場合
            render 'index'
        end
  end
  
  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :price, :quantity)
    end
end
