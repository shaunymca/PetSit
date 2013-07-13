# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    client_id 1
    due_date "2013-07-12 01:24:17"
    paid false
    user_id 1
  end
end
