FactoryBot.define do
  factory :order do
    school { build(:school) }
    status { "received" }
    notify {true}
  end
end
