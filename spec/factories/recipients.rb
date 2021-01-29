FactoryBot.define do
  factory :recipient do
    name { Faker::Name.name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    address { build(:address) }
    order { build(:order) }
  end
end
