FactoryBot.define do
  factory :group do
    name { Faker::Company.industry }
    icon { Faker::Avatar.image(size: '50x50') }
  end
end
