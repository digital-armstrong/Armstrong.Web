# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_19_101812) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["organization_id"], name: "index_buildings_on_organization_id"
  end

  create_table "channels", force: :cascade do |t|
    t.integer "channel_id"
    t.bigint "server_id", null: false
    t.bigint "service_id", null: false
    t.text "location_description"
    t.float "self_background", default: 0.0
    t.float "pre_emergency_limit", default: 1.0
    t.float "emergency_limit", default: 2.0
    t.float "consumption", default: 1.0
    t.float "conversion_coefficient", default: 0.0
    t.float "event_system_value", default: 0.0
    t.float "event_not_system_value", default: 0.0
    t.float "event_impulse_value", default: 0.0
    t.datetime "event_datetime"
    t.integer "event_count", default: 0
    t.integer "event_error_count", default: 0
    t.boolean "is_special_control", default: false
    t.boolean "is_online"
    t.string "state", default: "normal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "control_point_id"
    t.index ["control_point_id"], name: "index_channels_on_control_point_id"
    t.index ["server_id"], name: "index_channels_on_server_id"
    t.index ["service_id"], name: "index_channels_on_service_id"
  end

  create_table "control_points", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.bigint "device_id"
    t.string "control_point_type"
    t.index ["device_id"], name: "index_control_points_on_device_id"
    t.index ["room_id"], name: "index_control_points_on_room_id"
    t.index ["service_id"], name: "index_control_points_on_service_id"
  end

  create_table "device_components", force: :cascade do |t|
    t.bigint "supplementary_kit_id"
    t.string "serial_id"
    t.string "name"
    t.float "measurement_min"
    t.float "measurement_max"
    t.string "measuring_unit"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplementary_kit_id"], name: "index_device_components_on_supplementary_kit_id"
  end

  create_table "device_models", force: :cascade do |t|
    t.string "name"
    t.bigint "measurement_group_id", null: false
    t.bigint "measurement_class_id", null: false
    t.string "measuring_unit"
    t.string "safety_class"
    t.float "accuracy_class"
    t.float "measurement_sensitivity"
    t.float "measurement_min"
    t.float "measurement_max"
    t.bigint "manufacturer_id", null: false
    t.boolean "is_complete_device"
    t.boolean "is_tape_rolling_mechanism"
    t.string "doc_url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "calibration_min"
    t.float "calibration_max"
    t.index ["manufacturer_id"], name: "index_device_models_on_manufacturer_id"
    t.index ["measurement_class_id"], name: "index_device_models_on_measurement_class_id"
    t.index ["measurement_group_id"], name: "index_device_models_on_measurement_group_id"
  end

  create_table "device_reg_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer "inventory_id"
    t.string "serial_id"
    t.integer "tabel_id"
    t.bigint "device_model_id", null: false
    t.bigint "device_reg_group_id", null: false
    t.integer "year_of_production"
    t.integer "year_of_commissioning"
    t.bigint "supplementary_kit_id"
    t.bigint "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.string "inspection_expiration_status", default: "prepare_to_inspection", null: false
    t.string "status", default: "in_stock", null: false
    t.float "inspection_interval", default: 1.0, null: false
    t.index ["device_model_id"], name: "index_devices_on_device_model_id"
    t.index ["device_reg_group_id"], name: "index_devices_on_device_reg_group_id"
    t.index ["inventory_id"], name: "index_devices_on_inventory_id", unique: true
    t.index ["room_id"], name: "index_devices_on_room_id"
    t.index ["service_id"], name: "index_devices_on_service_id"
    t.index ["supplementary_kit_id"], name: "index_devices_on_supplementary_kit_id"
    t.index ["tabel_id"], name: "index_devices_on_tabel_id", unique: true
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_divisions_on_organization_id"
  end

  create_table "histories", force: :cascade do |t|
    t.bigint "channel_id", null: false
    t.float "event_impulse_value"
    t.float "event_system_value"
    t.float "event_not_system_value"
    t.datetime "event_datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_histories_on_channel_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.bigint "device_id", null: false
    t.string "type_target", null: false
    t.string "state", null: false
    t.datetime "conclusion_date"
    t.string "conclusion"
    t.text "description"
    t.bigint "creator_id", null: false
    t.bigint "performer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_inspections_on_creator_id"
    t.index ["device_id"], name: "index_inspections_on_device_id"
    t.index ["performer_id"], name: "index_inspections_on_performer_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "adress"
    t.string "phone"
    t.string "email"
    t.string "site_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measurement_classes", force: :cascade do |t|
    t.string "name"
    t.bigint "measurement_group_id", null: false
    t.integer "arms_device_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["measurement_group_id"], name: "index_measurement_classes_on_measurement_group_id"
  end

  create_table "measurement_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "full_address"
    t.string "zip_code"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "body"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "level"
    t.string "description"
    t.index ["building_id"], name: "index_rooms_on_building_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.string "ip_address"
    t.integer "inventory_id"
    t.bigint "service_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_servers_on_room_id"
    t.index ["service_id"], name: "index_servers_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.bigint "division_id", null: false
    t.bigint "organization_id", null: false
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_services_on_building_id"
    t.index ["division_id"], name: "index_services_on_division_id"
    t.index ["organization_id"], name: "index_services_on_organization_id"
  end

  create_table "supplementary_kits", force: :cascade do |t|
    t.string "name"
    t.string "serial_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "tabel_id", null: false
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.string "phone"
    t.string "avatar_url"
    t.bigint "service_id", null: false
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "timezone", default: "UTC", null: false
    t.string "role", default: "default", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["service_id"], name: "index_users_on_service_id"
    t.index ["tabel_id"], name: "index_users_on_tabel_id", unique: true
  end

  add_foreign_key "buildings", "organizations"
  add_foreign_key "channels", "control_points"
  add_foreign_key "channels", "servers"
  add_foreign_key "channels", "services"
  add_foreign_key "control_points", "devices"
  add_foreign_key "control_points", "rooms"
  add_foreign_key "control_points", "services"
  add_foreign_key "device_components", "supplementary_kits"
  add_foreign_key "device_models", "manufacturers"
  add_foreign_key "device_models", "measurement_classes"
  add_foreign_key "device_models", "measurement_groups"
  add_foreign_key "devices", "device_models"
  add_foreign_key "devices", "device_reg_groups"
  add_foreign_key "devices", "rooms"
  add_foreign_key "devices", "services"
  add_foreign_key "devices", "supplementary_kits"
  add_foreign_key "divisions", "organizations"
  add_foreign_key "histories", "channels"
  add_foreign_key "inspections", "devices"
  add_foreign_key "inspections", "users", column: "creator_id"
  add_foreign_key "inspections", "users", column: "performer_id"
  add_foreign_key "measurement_classes", "measurement_groups"
  add_foreign_key "posts", "users"
  add_foreign_key "rooms", "buildings"
  add_foreign_key "servers", "rooms"
  add_foreign_key "servers", "services"
  add_foreign_key "services", "buildings"
  add_foreign_key "services", "divisions"
  add_foreign_key "services", "organizations"
  add_foreign_key "users", "services"
end
