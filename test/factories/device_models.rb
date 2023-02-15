FactoryBot.define do
  factory :device_model do
    name
    measurement_group { association :measurement_group }
    measurement_class { association :measurement_class }
    measuring_unit { 'MyString' }
    safety_class { 'MyString' }
    accuracy_class { 1.5 }
    measurement_sensitivity { 1.5 }
    measurement_min { 1.5 }
    measurement_max { 1.5 }
    manufacturer { association :manufacturer }
    supplementary_kit { association :supplementary_kit }
    is_complete_device { false }
    is_tape_rolling_mechanism { false }
    doc_url { 'MyString' }
    image_url { 'MyString' }
  end
end
