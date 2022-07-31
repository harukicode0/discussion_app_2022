class CreateCommentReplies < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_replies do |t|
      t.string :text
      t.references :comment, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
