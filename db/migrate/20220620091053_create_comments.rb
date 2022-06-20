class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :text, null: false
      t.references :user, null: false
      t.references :room, null: false
      t.timestamps
    end
  end
end
