# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client do
    name "MyString"
    email "MyString"
    address_1 "MyString"
    address_2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    user_id 1
    active false
  end
end
