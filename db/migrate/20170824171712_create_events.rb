class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.datetime :start_time, default: -> { 'CURRENT_TIMESTAMP' }
      t.integer :length, default: 0
      t.integer :user_id, null: false
      t.integer :duration, null: false, default: 0

      t.timestamps
    end
  end
end
