# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit do
    client_id 1
    visit_type "MyText"
    visit_price 1
    visit_date "2013-02-23 03:56:38"
    invoice_id 1
  end
end
