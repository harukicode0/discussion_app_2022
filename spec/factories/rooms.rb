FactoryBot.define do
  factory :room do
    title {Faker::Lorem.sentence}
    deadline{Faker::Date.forward(days: rand(1..5))}
    owner_id {FactoryBot.create(:user).id}
  end
end