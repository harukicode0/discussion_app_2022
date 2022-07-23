FactoryBot.define do
  factory :room do
    title {Faker::Lorem.sentence}
    days{rand(1..5)}
    deadline{Faker::Date.forward(days: days)}
    association :user
  end
end