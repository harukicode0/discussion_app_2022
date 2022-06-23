class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.references :user_room, foreign_key: true
      t.integer :standing_position_id, null: false
      t.timestamps
    end
  end
end
