class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :name, null: false
      t.references :owner, foreign_key: { to_table: :users }
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
