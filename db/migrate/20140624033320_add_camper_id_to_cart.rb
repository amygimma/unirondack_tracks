class AddCamperIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :camper_id, :integer
  end
end
