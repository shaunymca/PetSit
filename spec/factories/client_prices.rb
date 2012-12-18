# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :client_price, :class => 'ClientPrices' do
    price "9.99"
    visit_type "MyString"
    client_id 1
  end
end
