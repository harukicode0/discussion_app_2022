FactoryBot.define do
  factory :issue_comment do
    text{Faker::Lorem.sentence}
    standing_position_id{rand(1..2)}
    association :user
    association :issue
  end
end
