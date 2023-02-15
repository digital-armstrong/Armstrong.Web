FactoryBot.define do
  factory :inspection do
    user { association :inspector }
    device { association :device }
    inspection_date { '2023-02-15 09:04:09' }
    inspection_conclusion { 'MyString' }
    description { 'MyText' }
  end
end
