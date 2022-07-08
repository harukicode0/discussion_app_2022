class CreateIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :issues do |t|
      t.string :issue_title, null: false
      t.references :room, foreign_key: true
      t.timestamps
    end
  end
end
