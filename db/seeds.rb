# seed Manufacturers
require 'faker'

15.times do |index|
  Manufacturer.create(
    name: Faker::Company.name,
    adress: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone_with_country_code,
    email: Faker::Internet.email,
    site_url: Faker::Internet.url
  )
end

# seed Reg Group
10.times do |index|
  DeviceRegGroup.create(name: Faker::Company.name)
end

meas_grp = ['Температурный', 'Рад. контроль', 'Электроизмеритель']
meas_cls = ['Термометр', 'МЭД', 'Альфа', 'Бета', 'Гамма', 'Вольтметр', 'Амперметр']

# seed MeasurementGroup
3.times { |index| MeasurementGroup.create(name: meas_grp[index]) }

# seed MeasurementClass
10.times do |index|
  MeasurementClass.create(
    name: meas_cls.sample,
    measurement_group: MeasurementGroup.find_by(name: meas_grp.sample),
    arms_device_type: rand(1..4)
  )
end

# seed SupplementaryKits
20.times do |i|
  SupplementaryKit.create(
    name: "#{Faker::Device.model_name}-kit-#{i}",
    serial_id: Faker::Device.serial,
    description: Faker::Books::Dune.quote
  )
end

100.times do |i|
  DeviceComponent.create(
    name: Faker::ElectricalComponents.active,
    serial_id: Faker::Device.serial,
    measurement_min: i.to_f / 2.0,
    measurement_max: i.to_f * 2.0,
    measuring_unit: "мЗв/ч",
    description: Faker::Restaurant.description,
    supplementary_kit: SupplementaryKit.find_by(id: rand(1..20))
  )
end

# seed DeviceModel
100.times do |i|
  DeviceModel.create(
    name: Faker::Device.model_name,
    measurement_group: MeasurementGroup.find_by(id: rand(1..3)),
    measurement_class: MeasurementClass.find_by(id: rand(1..10)),
    measuring_unit: "мЗв/ч",
    safety_class: "#{i}Н",
    accuracy_class: i.to_f,
    measurement_sensitivity: i.to_f,
    measurement_min: i.to_f / 2.0,
    measurement_max: i.to_f * 2.0,
    manufacturer: Manufacturer.find_by(id: rand(1..10)),
    is_complete_device: [true, false].sample,
    is_tape_rolling_mechanism: [true, false].sample,
    doc_url: Faker::Internet.url,
    image_url: Faker::Internet.url,
    inspection_interval: rand(0.1..9.9)
  )
end

# seed Organization
Organization.create(
  name: Faker::Company.name,
  full_address: Faker::Address.full_address,
  zip_code: Faker::Address.zip_code,
  phone: Faker::PhoneNumber.cell_phone_with_country_code,
  fax: Faker::PhoneNumber.cell_phone_with_country_code,
  email: Faker::Internet.email
)

# seed Division
10.times do |i|
  Division.create(
    name: Faker::FunnyName.name,
    organization: Organization.first
  )
end

# seed Building

10.times do |i|
  Building.create(
    name: "Build №#{i}",
    organization: Organization.first
  )
end

# seed Room

100.times do |i|
  Room.create(
    name: "#{i}",
    building: Building.find_by(id: rand(1..10)),
    level: rand(0.0..10.0)
  )
end

# seed Service

10.times do |i|
  Service.create(
    name: "Service-#{i}",
    division: Division.find_by(id: rand(1..10)),
    organization: Organization.first,
    building: Building.find_by(id: rand(1..10))
  )
end

# seed Server

10.times do |i|
  Server.create(
    name: "server-#{i}",
    ip_address: Faker::Internet.ip_v4_address,
    inventory_id: i,
    service: Service.find_by(id: rand(1..10)),
    room: Room.find_by(id: rand(1..100))
  )
end

# seed User
User.create(
  tabel_id: 0,
  first_name: 'Service',
  last_name: 'Administrator',
  second_name: nil,
  email: 'admin@admin.ru',
  password: '12345678',
  role: 'admin',
  service: Service.find_by(id: rand(1..10))
)

30.times do |i|
  User.create(
    tabel_id: 10000 + i,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "123456789#{i}",
    role: ['engineer', 'inspector', 'dosimetrist'].sample,
    service: Service.find_by(id: rand(1..10))
  )
end

# seed Device
300.times do |i|
  Device.create(
    inventory_id: i,
    serial_id: Faker::Device.serial,
    tabel_id: i,
    device_model: DeviceModel.find_by(id: rand(1..100)),
    device_reg_group: DeviceRegGroup.find_by(id: rand(1..5)),
    year_of_production: rand(1990..2020),
    year_of_commissioning: rand(1991..2020),
    supplementary_kit: SupplementaryKit.find_by(id: rand(1..20)),
    service: Service.find_by(id: rand(1..10)),
  )
end

# seed ControlPoints
200.times do |i|
  ControlPoint.create(
    name: Faker::Space.star_cluster,
    description: Faker::Space.star,
    room: Room.find_by(id: rand(1..99)),
    service: Service.find_by(id: rand(1..10)),
    device: Device.find_by(id: i + 1),
  )
end

# seed Post
10.times do |i|
  Post.create(
    user: User.first,
    title: Faker::Movies::HarryPotter.spell,
    body: Faker::Movies::HarryPotter.quote,
    category: "Public"
  )
end

# seed Inspection
20.times do |i|
  Inspection.create(
    device: Device.find_by_id(rand(1..1000)),
    creator: User.find_by_id(rand(1..10)),
    type_target: 'regular'
  )
end

100.times do |i|
  Inspection.create(
    device: Device.find_by_id(rand(1..20)),
    creator: User.find_by_id(rand(1..20)),
    performer: User.find_by_id(rand(1..20)),
    type_target: 'regular',
    state: 'verification_successful',
    conclusion_date: rand(1.year.ago..Time.now),
    conclusion: "Всё прекрасно! №#{i}"
  )
end

# seed Channel
100.times do |i|
  Channel.create(
    channel_id: "#{i}",
    control_point: ControlPoint.find_by(id: i + 1),
    server: Server.find_by(id: rand(1..10)),
    service: Service.find_by(id: rand(1..10)),
    location_description: "Description",
    self_background: 1.1,
    pre_emergency_limit: 2.2,
    emergency_limit: 3.3,
    consumption: 1.0,
    conversion_coefficient: 0.0,
    event_system_value: 0.0,
    event_not_system_value: 0.0,
    event_impulse_value: 0.0,
    event_datetime: Time.now,
    event_count: 0,
    event_error_count: 0,
    is_special_control: false,
    is_online: true,
    state: "normal"
  )
end

100.times do |i|
  History.create(
    channel: Channel.first,
    event_impulse_value: rand(0.0..100.0),
    event_system_value: rand(0.0..100.0),
    event_not_system_value: rand(0.0..100.0),
    event_datetime: Time.now,
  )

  History.create(
    channel: Channel.second,
    event_impulse_value: rand(0.0..100.0),
    event_system_value: rand(0.0..100.0),
    event_not_system_value: rand(0.0..100.0),
    event_datetime: Time.now,
  )
end
