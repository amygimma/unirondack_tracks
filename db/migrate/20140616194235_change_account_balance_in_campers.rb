class ChangeAccountBalanceInCampers < ActiveRecord::Migration
  def change
    change_column :campers, :account_balance, :float, default: 0
  end
end
