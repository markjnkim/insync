class DropLengthEvents < ActiveRecord::Migration[5.1]
  def change
    remove_column :events, :length
  end
end
