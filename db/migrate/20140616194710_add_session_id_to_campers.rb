class AddSessionIdToCampers < ActiveRecord::Migration
  def change
    add_column :campers, :session_id, :integer
  end
end