class CreateCampers < ActiveRecord::Migration
  def change
    create_table :campers do |t|
      t.string :name
      t.integer :account_balance

      t.timestamps
    end
  end
end
