class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.references :user, foreign_key: true
      t.references :room, foreign_key: true
      t.integer :standing_position_id, null: false
      t.timestamps
    end
  end
end
