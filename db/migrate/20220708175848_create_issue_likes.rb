class CreateIssueLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :issue_likes do |t|
      t.references :issue_comment, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
