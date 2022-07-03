class CreateRoomTags < ActiveRecord::Migration[6.1]
  def change
    create_table :room_tags do |t|
      t.references :room, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
