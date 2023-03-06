FactoryBot.define do
  factory :device do
    inventory_id { 1 }
    serial_id { 1 }
    tabel_id { 1 }
    device_model { association :device_model }
    device_reg_group { association :device_reg_group }
    year_of_production { 1990 }
    year_of_commissioning { 1991 }
  end
end
