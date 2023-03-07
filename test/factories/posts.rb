FactoryBot.define do
  factory :post do
    user { nil }
    title { 'MyString' }
    body { 'MyText' }
    category { 'MyString' }
  end
end
