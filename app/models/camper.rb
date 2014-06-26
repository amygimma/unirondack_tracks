class Camper < ActiveRecord::Base
  belongs_to :camp_session
  has_many :carts

  validates :account_balance, presence: true

  def charge_account(cart_total)
    self.update_attributes(account_balance: self.account_balance - cart_total )
  end


  def refund_account(item)
  end

end
