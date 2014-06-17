class ChangeSessionIdinCampers < ActiveRecord::Migration
  def change
    remove_column :campers, :session_id, :integer
    add_column :campers, :camp_session_id, :integer
  end
end
