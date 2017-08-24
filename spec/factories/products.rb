FactoryGirl.define do
  factory :product do
    product_name "MyString"
    quantity 1
    expiration_date "2017-08-24"
    references ""
  end
end
