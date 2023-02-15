FactoryBot.define do
  factory :server do
    name { "MyString" }
    ip_adress
    inventory_id { 1 }
    service { association :service }
    room { association :room }
  end
end
