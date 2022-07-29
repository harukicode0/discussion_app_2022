require 'rails_helper'
# bundle exec rspec spec/models/issue_comment_spec.rb

RSpec.describe IssueComment, type: :model do
  before do
    @issue_comment = FactoryBot.build(:issue_comment)
    sleep 0.2
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'textとstanding_position_idが存在していれば保存できる' do
        expect(@issue_comment).to be_valid
      end
    end
    context 'コメントが投稿できない場合' do
      it 'textが空では保存できない' do
        @issue_comment.text = ''
        @issue_comment.valid?
        expect(@issue_comment.errors.full_messages).to include("Textを入力してください")
      end
      it 'textが2001文字では保存できない' do
        @issue_comment.text = Faker::String.random(length: 2001) 
        @issue_comment.valid?
        expect(@issue_comment.errors.full_messages).to include("Textは2000文字以内で入力してください")
      end
      it 'standing_position_idが空では保存できない' do
        @issue_comment.standing_position_id = ''
        @issue_comment.valid?
        expect(@issue_comment.errors.full_messages).to include("Standing positionを入力してください")
      end
      it 'standing_position_idが0では保存できない' do
        @issue_comment.standing_position_id = 0
        @issue_comment.valid?
        expect(@issue_comment.errors.full_messages).to include("Standing positionは1以上の値にしてください")
      end
       it 'standing_position_idが3では保存できない' do
        @issue_comment.standing_position_id = 3
        @issue_comment.valid?
        expect(@issue_comment.errors.full_messages).to include("Standing positionは2以下の値にしてください")
      end
      it 'issueが紐付いていないと保存できない' do
        @issue_comment.issue = nil
        @issue_comment.valid?
        expect(@issue_comment.errors.full_messages).to include("Issueを入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @issue_comment.user = nil
        @issue_comment.valid?
        expect(@issue_comment.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end