class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
  
  private
  def item_params
    params.require(:items).permit(:genre_id, :name, :introduction, :price, :is_active, :image)
  end
  
  #def cart_item_params
      #params.require(:cart_item).permit(:item_id, :quantity)
  #end
end
