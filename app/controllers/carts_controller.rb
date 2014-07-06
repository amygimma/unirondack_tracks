class CartsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_cart, only: [:show, :update, :checkout]

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.create(cart_params)
    redirect_to cart_path(@cart) if @cart.save!
    redirect_to cart_path(@cart) unless @cart.save!
  end

  def show
    @total_price = get_cart_checkout_price
    @categories = Category.all
    @items = Item.all
    @cart_item = CartItem.new
  end

  def update
    @cart.update_attributes(cart_params)
    redirect_to cart_path(@cart)
  end

  def checkout
    @cart.update_attributes(complete: true)

    update_inventory

    charge_camper

    redirect_to cart_path(@cart), notice: "Checkout Complete"
  end
  
  def destroy
    Cart.destroy(params[:id])
    redirect_to new_cart_path
  end

  private

  def cart_params
    params.require(:cart).permit(:camper_id, :donation, :cash_out, :discount)
  end
  
  def get_cart_checkout_price
    total_item_prices
    @total_price = @total_price.inject( (@cart.donation || 0) + (@cart.cash_out || 0 ) ) { |total, n| total + n }
    apply_discount
  end

  def total_item_prices
    @total_price = []
    @cart.cart_items.each do |ci|
      @total_price << ci.item.price
    end
  end

  def apply_discount
    return @total_price unless @cart.discount
    discount_from_price = @total_price * @cart.discount
    @total_price -= discount_from_price
  end

  def update_inventory
     @cart.cart_items.each do |ci|
      ci.item.update_attributes(quantity: ci.item.quantity - 1)
      ci.item.update_attributes(sold: ci.item.sold + 1)
    end
  end

  def charge_camper
    camper = @cart.camper
    camper.charge_account(get_cart_checkout_price())
  end

  def find_cart
    @cart = Cart.find(params[:id])
  end

end
