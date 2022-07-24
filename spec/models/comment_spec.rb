require 'rails_helper'
# bundle exec rspec spec/models/comment_spec.rb

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'textとstanding_position_idが存在していれば保存できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できない場合' do
      it 'textが空では保存できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Textを入力してください")
      end
      it 'standing_position_idが空では保存できない' do
        @comment.standing_position_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Standing positionを入力してください")
      end
      it 'standing_position_idが0では保存できない' do
        @comment.standing_position_id = 0
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Standing positionは1以上の値にしてください")
      end
       it 'standing_position_idが3では保存できない' do
        @comment.standing_position_id = 3
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Standing positionは2以下の値にしてください")
      end
      it 'roomが紐付いていないと保存できない' do
        @comment.room = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Roomを入力してください")
      end
      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

