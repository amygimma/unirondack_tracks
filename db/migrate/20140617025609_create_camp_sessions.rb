class CreateCampSessions < ActiveRecord::Migration
  def change
    create_table :camp_sessions do |t|
      t.string :name

      t.timestamps
    end
  end
end
