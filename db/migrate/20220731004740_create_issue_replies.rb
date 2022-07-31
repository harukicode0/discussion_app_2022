class CreateIssueReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :issue_replies do |t|
      t.string :text
      t.references :issue_comment, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
