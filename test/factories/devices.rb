FactoryBot.define do
  factory :device do
    inventory_id
    serial_id
    tabel_id
    device_model { association :device_model }
    device_reg_group { association :device_reg_group }
    year_of_production { 1990 }
    year_of_commissioning { 1991 }
    supplementary_kit { association :supplementary_kit }
  end
end
