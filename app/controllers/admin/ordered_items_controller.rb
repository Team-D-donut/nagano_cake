class Admin::OrderedItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def update
    @ordered_item = OrderedItem.find(params[:id])
    @order = @ordered_item.order
    @ordered_items = @order.ordered_items.all

    is_updated = true
    if @ordered_item.update(ordered_item_params)
      @order.update(status: 2) if @ordered_item.make_status == "in_production"

      @ordered_items.each do |ordered_item|
      if ordered_item.make_status != "production_complete"
        is_updated = false
      end
    end
    @order.update(status: 3) if is_updated
    end
  redirect_to admin_order_path(@order)
  end

  private
  def ordered_item_params
    params.require(:ordered_item).permit(:make_status)
  end
end