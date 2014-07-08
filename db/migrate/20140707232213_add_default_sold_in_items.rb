class AddDefaultSoldInItems < ActiveRecord::Migration
  def change
  	change_column :items, :sold, :integer, default: 0
  end
end
