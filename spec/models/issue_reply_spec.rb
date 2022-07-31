require 'rails_helper'
# bundle exec rspec spec/models/issue_reply_spec.rb

RSpec.describe IssueReply, type: :model do
  before do
    @issue_reply = FactoryBot.build(:issue_reply)
    sleep 0.2
  end

  describe 'リプライ投稿' do
    context 'リプライ投稿できる場合' do
      it 'textが存在していれば保存できる' do
        expect(@issue_reply).to be_valid
      end
    end
    context 'リプライが投稿できない場合' do
      it 'textが空では保存できない' do
        @issue_reply.text = ''
        @issue_reply.valid?
        expect(@issue_reply.errors.full_messages).to include("Textを入力してください")
      end
      it 'textが2001文字では保存できない' do
        @issue_reply.text = Faker::String.random(length: 2001)
        @issue_reply.valid?
        expect(@issue_reply.errors.full_messages).to include("Textは2000文字以内で入力してください")
      end
      it 'commentが紐付いていないと保存できない' do
        @issue_reply.issue_comment = nil
        @issue_reply.valid?
        expect(@issue_reply.errors.full_messages).to include("Issue commentを入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @issue_reply.user = nil
        @issue_reply.valid?
        expect(@issue_reply.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

