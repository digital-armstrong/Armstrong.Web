# seed Manufacturers

10.times do |i|
  Manufacturer.create(
    name: "Manufacturer_name_#{i}",
    adress: "г. Ульяновск, Ленина #{i}",
    phone: "+7 (999) 999-01-#{i}",
    email: "man_email#{i}@mail.ru",
    site_url: "https://site_#{i}.com"
  )
end

# seed Reg Group

5.times do |i|
  dev_rg = DeviceRegGroup.new

  dev_rg.name = "Group_#{i}"

  dev_rg.save
end

# seed MeasurementGroup

5.times do |i|
  MeasurementGroup.create(
    name: "Group_#{i}"
  )
end

# seed MeasurementClass

15.times do |i|
  MeasurementClass.create(
    name: "Group_#{i}",
    measurement_group: MeasurementGroup.find_by(id: rand(1..5)),
    arms_device_type: rand(1..3)
  )
end

# seed SupplementaryKits

20.times do |i|
  SupplementaryKit.create(
    name: "Kit №#{i}",
    serial_id: "#{i * 100}-E250-FF",
    description: "Набор для приборов типа МКС-1117-#{i}"
  )
end

# seed DeviceModel

100.times do |i|
  DeviceModel.create(
    name: "Model_name_#{i}",
    measurement_group: MeasurementGroup.find_by(id: rand(1..5)),
    measurement_class: MeasurementClass.find_by(id: rand(1..15)),
    measuring_unit: "мЗв/ч",
    safety_class: "#{i}Н",
    accuracy_class: i.to_f,
    measurement_sensitivity: i.to_f,
    measurement_min: i.to_f / 2.0,
    measurement_max: i.to_f * 2.0,
    manufacturer: Manufacturer.find_by(id: rand(1..10)),
    supplementary_kit: SupplementaryKit.find_by(id: rand(0..20)),
    is_complete_device: [true, false].sample,
    is_tape_rolling_mechanism: [true, false].sample,
    doc_url: "/this/is/doc/path/#{i}",
    image_url: "/no/way/this/is/img#{i}"
  )
end

# seed Device

1000.times do |i|
  Device.create(
    inventory_id: i,
    serial_id: "#{i}-123-N",
    tabel_id: i,
    device_model: DeviceModel.find_by(id: rand(1..100)),
    device_reg_group: DeviceRegGroup.find_by(id: rand(1..5)),
    year_of_production: 1990,
    year_of_commissioning: 1991
  )
end

