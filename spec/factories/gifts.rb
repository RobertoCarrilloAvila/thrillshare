FactoryBot.define do
  factory :gift do
    order { build(:order) }
    kind { "mug" }
    size { nil }
  end
end
