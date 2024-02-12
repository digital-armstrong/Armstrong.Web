FactoryBot.define do
  factory :control_point do
    name { 'MyString' }
    description { 'MyString' }
    room { nil }
    channel { nil }
    device { nil }
    service { association :service }
  end
end
