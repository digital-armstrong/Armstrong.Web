FactoryBot.define do
  factory :measurement_class do
    name
    measurement_group { association :measurement_group }
    arms_device_type { 1 }
  end
end
