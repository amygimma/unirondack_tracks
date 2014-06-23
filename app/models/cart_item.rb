class CartItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  def self.initialize_new(cart)
    new(cart: cart)
  end

end
