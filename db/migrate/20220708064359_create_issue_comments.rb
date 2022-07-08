class CreateIssueComments < ActiveRecord::Migration[6.1]
  def change
    create_table :issue_comments do |t|
      t.text :text, null: false
      t.references :issue, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :standing_position_id, null: false
      t.timestamps
    end
  end
end
