FactoryBot.define do
  factory :device_component do
    serial_id { 1 }
    name { 'MyString' }
    device_model { nil }
    measurement_max { 1.5 }
    measurement_min { 1.5 }
    measuring_unit { 'MyString' }
    description { 'MyString' }
  end
end
