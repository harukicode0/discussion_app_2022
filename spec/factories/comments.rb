FactoryBot.define do
  factory :comment do
    text{Faker::Lorem.sentence}
    standing_position_id{rand(1..2)}
    association :user
    association :room
  end
end
