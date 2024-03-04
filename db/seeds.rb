# seed Manufacturers

Manufacturer.create(
  name: "НПП ДОЗА",
  adress: "124498, город Москва, город Зеленоград, Георгиевский проспект, дом 5, этаж 2, комната 49, ООО НПП «Доза»",
  phone: "+7 (495) 777-84-85",
  email: "info@doza.ru",
  site_url: "https://www.doza.ru/"
)

Manufacturer.create(
  name: "ОАО Пятигорский завод Импульс",
  adress: "357500, Россия, Ставропольский край, г. Пятигорск, ул. Малыгина, 5, ОАО «Пятигорский завод «Импульс»",
  phone: "+7 (879) 333-65-14",
  email: "contact@pzi.ru",
  site_url: "http://pzi.ru/"
)

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

DeviceRegGroup.create(name: "ГАН")
DeviceRegGroup.create(name: "РосТехНадзор")
DeviceRegGroup.create(name: "Без группы")

# seed MeasurementGroup

MeasurementGroup.create(name: "Температурный")
MeasurementGroup.create(name: "Рад. контроль")
MeasurementGroup.create(name: "Электроизмеритель")

# seed MeasurementClass

MeasurementClass.create(
  name: "Термометр",
  measurement_group: MeasurementGroup.find_by(name: "Температурный"),
  arms_device_type: nil
)

MeasurementClass.create(
  name: "МЭД",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  arms_device_type: 1
)

MeasurementClass.create(
  name: "Альфа",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  arms_device_type: 1
)

MeasurementClass.create(
  name: "Бета",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  arms_device_type: 1
)

MeasurementClass.create(
  name: "Гамма",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  arms_device_type: 1
)

MeasurementClass.create(
  name: "Активность Аэрозолей",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  arms_device_type: 3
)

MeasurementClass.create(
  name: "Активность Газов",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  arms_device_type: 3
)

MeasurementClass.create(
  name: "Радиометр/Дозиметр",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  arms_device_type: nil
)

MeasurementClass.create(
  name: "Амперметр",
  measurement_group: MeasurementGroup.find_by(name: "Электроизмеритель"),
  arms_device_type: nil
)

MeasurementClass.create(
  name: "Вольтметр",
  measurement_group: MeasurementGroup.find_by(name: "Электроизмеритель"),
  arms_device_type: nil
)

# seed SupplementaryKits

SupplementaryKit.create(
  name: "МКС-АТ1117М-комплект-1",
  serial_id: "310",
  description: "Набор для приборов типа МКС-АТ1117М с тремя БД (Бета, Альфа, Альфа)"
)

20.times do |i|
  SupplementaryKit.create(
    name: "Kit №#{i}",
    serial_id: "#{i * 100}-E250-FF",
    description: "Набор для приборов типа МКС-1117-#{i}"
  )
end

100.times do |i|
  DeviceComponent.create(
    name: "Device Component #{i}",
    serial_id: "#{i * 100}-E250-FF",
    measurement_min: i.to_f / 2.0,
    measurement_max: i.to_f * 2.0,
    measuring_unit: "мЗв/ч",
    description: "Набор для теста",
    supplementary_kit: SupplementaryKit.find_by(id: rand(1..20))
  )
end
# seed DeviceModel

DeviceModel.create(
  name: "МКС-АТ1117М (БОИ)",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  measurement_class: MeasurementClass.find_by(name: "Радиометр/Дозиметр"),
  measuring_unit: "Зв",
  safety_class: "3Н",
  accuracy_class: 0.2,
  measurement_sensitivity: nil,
  measurement_min: 0.001,
  measurement_max: 1.0,
  manufacturer: Manufacturer.find_by(name: "НПП ДОЗА"),
  is_complete_device: false,
  is_tape_rolling_mechanism: false,
  doc_url: "https://www.doza.ru/catalog/handheld/124/",
  image_url: nil,
  inspection_interval: rand(0.1..9.9)
)

DeviceModel.create(
  name: "МКС-АТ1117М (БДПБ-01)",
  measurement_group: MeasurementGroup.find_by(name: "Рад. контроль"),
  measurement_class: MeasurementClass.find_by(name: "Радиометр/Дозиметр"),
  measuring_unit: "мин-1·см-2",
  safety_class: "3Н",
  accuracy_class: 0.2,
  measurement_sensitivity: nil,
  measurement_min: 1,
  measurement_max: 500000,
  manufacturer: Manufacturer.find_by(name: "НПП ДОЗА"),
  is_complete_device: false,
  is_tape_rolling_mechanism: false,
  doc_url: "https://www.doza.ru/catalog/handheld/124/",
  image_url: nil,
  inspection_interval: rand(0.1..9.9)
)

100.times do |i|
  DeviceModel.create(
    name: "Model_name_#{i}",
    measurement_group: MeasurementGroup.find_by(name: "Температурный"),
    measurement_class: MeasurementClass.find_by(name: "Термометр"),
    measuring_unit: "мЗв/ч",
    safety_class: "#{i}Н",
    accuracy_class: i.to_f,
    measurement_sensitivity: i.to_f,
    measurement_min: i.to_f / 2.0,
    measurement_max: i.to_f * 2.0,
    manufacturer: Manufacturer.find_by(id: rand(1..10)),
    is_complete_device: [true, false].sample,
    is_tape_rolling_mechanism: [true, false].sample,
    doc_url: "/this/is/doc/path/#{i}",
    image_url: "/no/way/this/is/img#{i}",
    inspection_interval: rand(0.1..9.9)
  )
end

# seed Organization

Organization.create(
  name: "АО ГНЦ НИИАР",
  full_address: "Западное шоссе 9",
  zip_code: "9001",
  phone: "5-55-55",
  fax: "5-55-55",
  email: "niiar@niiar.ru"
)

# seed Division

10.times do |i|
  Division.create(
    name: "Division-#{i}",
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
    ip_address: "192.168.20.#{i}",
    inventory_id: i,
    service: Service.find_by(id: rand(1..10)),
    room: Room.find_by(id: rand(1..100))
  )
end

# seed User

User.create(
  tabel_id: 0,
  first_name: 'Admin',
  last_name: 'Adminov',
  second_name: 'Adminovich',
  email: 'admin@admin.ru',
  password: '12345678',
  role: 'admin',
  service: Service.find_by(id: rand(1..10))
)

10.times do |i|
  User.create(
    tabel_id: 72000 + i,
    first_name: "First#{i}",
    last_name: "Last#{i}",
    email: "engineer#{i}@email.ru",
    password: "123456789#{i}",
    role: 'engineer',
    service: Service.find_by(id: rand(1..10))
  )
end

10.times do |i|
  User.create(
    tabel_id: 82000 + i,
    first_name: "First#{i}",
    last_name: "Last#{i}",
    email: "inspector#{i}@email.ru",
    password: "123456789#{i}",
    role: 'inspector',
    service: Service.find_by(id: rand(1..10))
  )
end

10.times do |i|
  User.create(
    tabel_id: 92000 + i,
    first_name: "First#{i}",
    last_name: "Last#{i}",
    email: "dosimetrist#{i}@email.ru",
    password: "123456789#{i}",
    role: 'dosimetrist',
    service: Service.find_by(id: rand(1..10))
  )
end

# seed Device

300.times do |i|
  Device.create(
    inventory_id: i,
    serial_id: "#{i}-123-N",
    tabel_id: i,
    device_model: DeviceModel.find_by(id: rand(1..100)),
    device_reg_group: DeviceRegGroup.find_by(id: rand(1..5)),
    year_of_production: 1990,
    year_of_commissioning: 1991,
    supplementary_kit: SupplementaryKit.find_by(id: rand(1..20)),
    service: Service.find_by(id: rand(1..10)),
  )
end

# seed ControlPoints
200.times do |i|
  ControlPoint.create(
    name: "Точка контроля #{i}",
    description: "Возможное описание",
    room: Room.find_by(id: rand(1..99)),
    service: Service.find_by(id: rand(1..10)),
    device: Device.find_by(id: i + 1),
  )
end

# seed Post

10.times do |i|
  Post.create(
    user: User.first,
    title: "This is post title №#{i}",
    body: "Some who have read the book, or at any rate have reviewed it, found it boring, absurd, or contemptible, and I have no cause to complain, since I have similar opinions of their works, or of the kinds of writing that they evidently prefer.",
    category: "Public"
  )
end

2.times do |i|
  Post.create(
    user: User.first,
    title: "This is post title №#{i}",
    body: "Some who have read the book, or at any rate have reviewed it, found it boring, absurd, or contemptible, and I have no cause to complain, since I have similar opinions of their works, or of the kinds of writing that they evidently prefer.",
    category: "УРБ-106"
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
    channel_id: Channel.first,
    event_impulse_value: rand(0.0..100.0),
    event_system_value: Time.now,
    event_not_system_value: rand(0.0..100.0),
    event_datetime: Time.now,
  )

  History.create(
    channel_id: Channel.last,
    event_impulse_value: rand(0.0..100.0),
    event_system_value: Time.now,
    event_not_system_value: rand(0.0..100.0),
    event_datetime: Time.now,
  )
end
