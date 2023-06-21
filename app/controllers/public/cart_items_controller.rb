class Public::CartItemsController < ApplicationController
  def index
    @cart_items= current_customer.cart_items.all
    # カートに入ってる商品の合計金額
    @total = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end
end
