require 'rails_helper'
# bundle exec rspec spec/models/room_spec.rb

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
    sleep 0.2
  end

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it "titleの値,deadlineが今日の日付以上または5日以下であれば作成できる" do
        expect(@room).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "titleが空では作成できない" do
        @room.title = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Titleを入力してください")
      end
      it 'owner_idが空では作成できない' do
        @room.owner_id = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Ownerを入力してください")
      end
      it "deadlineが空欄では作成できない" do
        @room.deadline = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Deadline開催期間は1〜5日のいずれかを選択してください")
      end
      it "deadlineが6日後以降では作成できない" do
        @room.deadline = Time.zone.now + 6.days
        @room.valid?
        expect(@room.errors.full_messages).to include("Deadline開催期間は1〜5日のいずれかを選択してください")
      end
      it "deadlineが1日前では作成できない" do
        @room.deadline = Time.zone.now - 1.days
        @room.valid?
        expect(@room.errors.full_messages).to include("Deadline開催期間は1〜5日のいずれかを選択してください")
      end
    end
  end
end
