FactoryGirl.define do
  factory :product do
    productid 'S1'
    product_name 'Sony Speakers'
    association :category
    price 100
  end
end