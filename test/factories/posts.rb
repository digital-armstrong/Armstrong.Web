FactoryBot.define do
  factory :post do
    user { association :user }
    title { 'MyString' }
    body { 'MyText' }
    category { 'MyString' }
  end
end
