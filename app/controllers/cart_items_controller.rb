class CartItemsController < ApplicationController
  before_action :authenticate_user!
  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.create(cart_item_params)
    redirect_to cart_path(@cart_item.cart) if @cart_item.save!
  end

  def update
    # @cart_item = CartItem.find(params[:id]).cart
  end
  
  def destroy
    @cart = Cart.find(params[:cart_id])
    @cart.items.destroy(params[:id])
    redirect_to "/carts/" + params[:cart_id].to_s
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:cart_id, :item_id)
  end
end
