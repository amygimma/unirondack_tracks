class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :camper

  validates :camper_id, presence: true

  def update_cart_total_and_checkout
    @total_price = []
    self.cart_items.each do |ci|
      @total_price << ci.item.price
    end
    item_prices = self.cart_items.map { |ci| ci.item.price }
    @total_price = item_prices.inject( ( self.donation || 0 + self.cash_out || 0 ) ) { |total, n| total + n }
    self.update_attributes(total: @total_price, complete: true)
  end
end
