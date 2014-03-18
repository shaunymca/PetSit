# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pet do
    client_id 1
    animal_name "MyString"
    pet_type "MyString"
    breed "MyString"
    color "MyString"
    fixed false
    birthdate ""
    active false
    sex "MyString"
    notes "MyText"
  end
end
