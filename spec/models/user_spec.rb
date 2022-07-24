require 'rails_helper'
# bundle exec rspec spec/models/user_spec.rb

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nickname,email,passwordが入力されているとユーザー登録できる' do
        expect(@user).to be_valid
      end
      it 'nickname,email,passwordが入力されていれば、画像がなくてもユーザー登録できる' do
        @user.image = nil
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは128文字以内で入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = @user.email.delete!('@')
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
    end
  end

  describe 'ユーザー編集' do
    context 'ユーザー編集できる時' do
      it '投稿する写真がjpeg形式の時保存できる' do
        @user.image = nil
        user.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
        binding.pry
        
      end
      it '投稿する写真がpng形式の時保存できる' do
        
      end
      it '投稿する写真がjpg形式の時保存できる' do
        
      end
    end
    context 'ユーザー編集できない時' do
      it '投稿する写真がpdf形式の時保存できない' do
        
      end
    end
  end
end