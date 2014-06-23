class CreateCarts < ActiveRecord::Migration
  def change
    drop_table :carts
    drop_table :shopping_carts
    create_table :carts do |t|
        t.integer :user_id
        t.integer :total
      t.timestamps
    end
  end
end
