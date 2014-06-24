class CartsController < ApplicationController
  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create
    redirect_to cart_path(@cart)
  end

  def show
    @cart = Cart.find(params[:id])
    @categories = Category.all
    @items = Item.all
    @cart_item = CartItem.new
  end

  def update
  end
end
