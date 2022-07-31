FactoryBot.define do
  factory :comment_reply do
    text{Faker::Lorem.sentence}
    association :user
    association :comment
  end
end
