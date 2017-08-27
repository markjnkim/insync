class DropLocationFromEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :location
  end
end
