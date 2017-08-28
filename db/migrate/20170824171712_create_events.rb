class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_time, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :location, null: false

      t.timestamps
    end
  end
end
