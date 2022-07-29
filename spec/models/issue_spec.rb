require 'rails_helper'
# bundle exec rspec spec/models/issue_spec.rb

RSpec.describe Issue, type: :model do
  before do
    @issue = FactoryBot.build(:issue)
  end

  describe 'チャットルーム作成' do
    context '新規作成できる場合' do
      it "titleがあれば作成できる" do
        expect(@issue).to be_valid
      end
    end
    context '新規作成できない場合' do
      it "titleが空では作成できない" do
        @issue.issue_title = ''
        @issue.valid?
        expect(@issue.errors.full_messages).to include("Issue titleを入力してください")
      end
      it "titleが2文字では作成できない" do
        @issue.issue_title = 'ab'
        @issue.valid?
        expect(@issue.errors.full_messages).to include("Issue titleは3文字以上で入力してください")
      end
      it "titleが201文字では作成できない" do
        @issue.issue_title = Faker::String.random(length: 201) 
        @issue.valid?
        expect(@issue.errors.full_messages).to include("Issue titleは200文字以内で入力してください")
      end
      it "roomが紐づいていないと作成できない" do
        @issue.room = nil
        @issue.valid?
        expect(@issue.errors.full_messages).to include("Roomを入力してください")
      end
      it "owner_idが空だと作成できない" do
        @issue.owner_id = ''
        @issue.valid?
        expect(@issue.errors.full_messages).to include("Ownerを入力してください")
      end
    end
  end
end
