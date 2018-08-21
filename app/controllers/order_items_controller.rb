class OrderItemsController < ApplicationController

  def create
   @cart = current_cart
   @item = @cart.order_items.build(item_params)
   @cart.save
   session[:cart_id] = @cart.id
   redirect_to cart_path
  end

  def destroy
    @order = current_cart
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
  end

  private
  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
