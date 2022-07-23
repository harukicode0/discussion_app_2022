FactoryBot.define do
  factory :issue do
    issue_title {Faker::Lorem.sentence}
    association :user
    association :room
  end
end
