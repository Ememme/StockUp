FactoryGirl.define do
  factory :storage do
    association :user, factory: :user
    storage_name { %w[Fridge Refrigerator Pantry].sample }
  end
end
