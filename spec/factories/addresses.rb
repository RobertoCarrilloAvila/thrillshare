FactoryBot.define do
  factory :address do
    state { Faker::Address.state }
    zip_code { Faker::Address.zip_code }
    city { Faker::Address.city }
    street { Faker::Address.street_name }
  end
end
