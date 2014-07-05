class AddDontationToCarts < ActiveRecord::Migration
  def change
  	add_column :carts, :donation, :float, default: 0
  end
end
