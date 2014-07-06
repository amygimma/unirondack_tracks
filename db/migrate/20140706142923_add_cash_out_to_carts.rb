class AddCashOutToCarts < ActiveRecord::Migration
  def change
  	add_column :carts, :cash_out, :float, default: 0
  end
end
 