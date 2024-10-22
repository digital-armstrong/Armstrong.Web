FactoryBot.define do
  factory :post do
    user { association :user }
    title { 'MyString' }
    body { Faker::Lorem.paragraphs(number: 4).join('\n') }
    category { 'MyString' }
  end
end
