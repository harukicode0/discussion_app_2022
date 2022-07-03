class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title, null: false
      t.datetime :deadline, null: false
      t.timestamps
    end
  end
end
