FactoryBot.define do
  factory :manufacturer do
    name
    adress { 'MyString' }
    phone { 'MyString' }
    email
    site_url { 'MyString' }
  end
end
