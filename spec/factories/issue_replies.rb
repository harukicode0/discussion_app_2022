FactoryBot.define do
  factory :issue_reply do
    text{Faker::Lorem.sentence}
    association :user
    association :issue_comment
  end
end
