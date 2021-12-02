FactoryBot.define do
  factory :purchase do
    name { Faker::Job.position }
    amount { Faker::Number.within(range: 1..10) }
  end
end
