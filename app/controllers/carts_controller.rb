class CartsController < ApplicationController
  before_action :authenticate_user!
  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create(cart_params)
    redirect_to cart_path(@cart) if @cart.save!
    redirect_to cart_path(@cart) unless @cart.save!
  end

  def show
    @cart = Cart.find(params[:id])
    @categories = Category.all
    @items = Item.all
    @cart_item = CartItem.new
  end

  def update
  end

  private

  def cart_params
    params.require(:cart).permit(:camper_id)
  end
end
