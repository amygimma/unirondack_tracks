class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :camper

  validates :camper_id, presence: true

  def update_cart_total
    @total_price = []
    self.cart_items.each do |ci|
      @total_price << ci.item.price
    end
    @total_price = @total_price.inject( ( self.donation || 0 + self.cash_out || 0 ) ) { |total, n| total + n }
    self.update_attributes(total: @total_price)
  end
end
