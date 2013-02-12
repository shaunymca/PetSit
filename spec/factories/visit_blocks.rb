# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit_block do
    visit_type "MyString"
    visit_price 1
    visit_date_start "2013-02-12 02:19:32"
    visit_date_end "2013-02-12 02:19:32"
    monday false
    tuesday false
    wednesday false
    thurs "MyString"
  end
end
