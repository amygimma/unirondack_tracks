class AddCompleteToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :complete, :boolean, default: false
  end
end
