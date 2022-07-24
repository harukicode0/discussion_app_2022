FactoryBot.define do
  factory :issue do
    issue_title {Faker::Lorem.sentence}
    owner_id {FactoryBot.create(:user).id}
    association :room
  end
end
