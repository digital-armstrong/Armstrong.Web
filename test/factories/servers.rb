FactoryBot.define do
  factory :server do
    name { 'MyString' }
    ip_address { '127.0.0.1' }
    inventory_id { 1 }
    service { association :service }
    room { association :room }
  end
end
