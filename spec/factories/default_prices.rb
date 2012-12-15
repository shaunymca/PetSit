# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :default_price do
    user_id 1
    visit_type "MyString"
    price "9.99"
  end
end
