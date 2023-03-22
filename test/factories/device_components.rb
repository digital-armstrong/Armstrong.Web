FactoryBot.define do
  factory :device_component do
    supplementary_kit { nil }
    serial_id { "MyString" }
    name { "MyString" }
    measurement_min { 1.5 }
    measurement_max { 1.5 }
    measuring_unit { "MyString" }
    description { "MyText" }
  end
end
