class CartItemsController < ApplicationController

  def new
    @cart_item = Cart.new
    cart = CartItem.find(params[:id]).cart

    redirect_to cart_path(cart)
  end

  def create
    # cart = CartItem.find(params[:id]).cart
    # redirect_to cart_path(cart), notice: "cart updated"
  end

  def update
    cart = CartItem.find(params[:id]).cart
    redirect_to cart_path(cart), notice: "cart updated"
  end
end
