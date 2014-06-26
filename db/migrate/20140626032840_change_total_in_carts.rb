class ChangeTotalInCarts < ActiveRecord::Migration
  def change
    change_column :carts, :total, :float, default: 0
  end
end
