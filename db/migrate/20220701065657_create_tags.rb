class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :tag_name,uniqueness: true
      t.timestamps
    end
  end
end
