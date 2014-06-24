class AddSizeFlavorToItems < ActiveRecord::Migration
  def change
    add_column :items, :size, :string
    add_column :items, :flavor, :string
  end
end
