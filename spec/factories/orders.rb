FactoryBot.define do
  factory :order do
    school { build(:school) }
    status { 0 }
  end
end
