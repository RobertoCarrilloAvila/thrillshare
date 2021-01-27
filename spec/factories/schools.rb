FactoryBot.define do
  factory :school do
    name { Faker::Educator.secondary_school }
    address { Address.first }
  end
end
