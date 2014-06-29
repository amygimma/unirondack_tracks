class AddStartingBalanceToCamper < ActiveRecord::Migration
  def change
    add_column :campers, :starting_balance, :float
  end
end
