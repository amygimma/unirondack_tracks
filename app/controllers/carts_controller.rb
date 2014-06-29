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
    flash[:notice] = "Not enough in account balance"

    @total_price = []
    @cart = Cart.find(params[:id])
    @cart.cart_items.each do |ci|
      #make into model methods
      @total_price << ci.item.price
    end
    @total_price = @total_price.sum
    @categories = Category.all
    @items = Item.all
    @cart_item = CartItem.new
  end

  def update
  end

  def total_cart
    # return and notice: "Please add items to cart" if @cart.cart_items.empty?
    @cart = Cart.find(params[:id])
    @total_price = []
    @cart.cart_items.each do |ci|
      #make into model methods
      @total_price << ci.item.price
    end
    @total_price = @total_price.sum
    @cart.update_attributes(total: @total_price)
    redirect_to cart_path(@cart)
  end

  def checkout
    # return and notice: "Please add items to cart and press 'Cart Total' before completing" if @cart.total == 0
    # return and notice: "This cart has already been checked out. Please start a new cart" if @cart.complete?

    @cart = Cart.find(params[:id])
    @cart.update_attributes(complete: true)
    @cart.cart_items.each do |ci|
      #make into model methods

      ci.item.update_attributes(quantity: ci.item.quantity - 1)
      ci.item.update_attributes(sold: ci.item.sold + 1)
    end
    camper = @cart.camper
    camper.charge_account(@cart.total)
    redirect_to cart_path(@cart), notice: "Checkout Complete"
  end
  
  def destroy
    Cart.destroy(params[:id])
    redirect_to new_cart_path
  end

  private

  def cart_params
    params.require(:cart).permit(:camper_id)
  end
end
