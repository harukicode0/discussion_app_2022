class CreateUserRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rooms do |t|
      t.references :user, null: false
      t.references :room, null: false
      t.integer :position_id
      t.timestamps
    end
  end
end
