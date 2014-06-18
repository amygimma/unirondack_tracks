# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name "Hat"
    price 8.5
    quantity 100
    sold 1
  end
end
