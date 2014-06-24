class Cart < ActiveRecord::Base
  has_many :cart_items
  has_many :items, through: :cart_items

  validates :camper_id, presence: true


  belongs_to :cart

end
