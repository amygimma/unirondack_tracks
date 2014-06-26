class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items
  belongs_to :camper

  validates :camper_id, presence: true

end
