class Camper < ActiveRecord::Base
  belongs_to :camp_session

  has_many :carts
end
