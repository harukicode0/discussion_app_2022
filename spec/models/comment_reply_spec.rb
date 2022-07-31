require 'rails_helper'
# bundle exec rspec spec/models/comment_reply_spec.rb

RSpec.describe IssueReply, type: :model do
  before do
    @comment_reply = FactoryBot.build(:comment_reply)
    sleep 0.2
  end

  describe 'リプライ投稿' do
    context 'リプライ投稿できる場合' do
      it 'textが存在していれば保存できる' do
        expect(@comment_reply).to be_valid
      end
    end
    context 'リプライが投稿できない場合' do
      it 'textが空では保存できない' do
        @comment_reply.text = ''
        @comment_reply.valid?
        expect(@comment_reply.errors.full_messages).to include("Textを入力してください")
      end
      it 'textが2001文字では保存できない' do
        @comment_reply.text = Faker::String.random(length: 2001)
        @comment_reply.valid?
        expect(@comment_reply.errors.full_messages).to include("Textは2000文字以内で入力してください")
      end
      it 'commentが紐付いていないと保存できない' do
        @comment_reply.comment = nil
        @comment_reply.valid?
        expect(@comment_reply.errors.full_messages).to include("Commentを入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @comment_reply.user = nil
        @comment_reply.valid?
        expect(@comment_reply.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

