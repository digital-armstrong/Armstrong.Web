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

ActiveRecord::Schema[7.0].define(version: 2023_02_15_094522) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_buildings_on_organization_id"
  end

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.integer "channel_id"
    t.bigint "device_id", null: false
    t.bigint "room_id", null: false
    t.bigint "server_id", null: false
    t.bigint "service_id", null: false
    t.text "location_description"
    t.float "self_background", default: 0.0
    t.float "pre_emergency_limit", default: 1.0
    t.float "emergency_limit", default: 2.0
    t.float "consumptiom", default: 1.0
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
    t.index ["device_id"], name: "index_channels_on_device_id"
    t.index ["room_id"], name: "index_channels_on_room_id"
    t.index ["server_id"], name: "index_channels_on_server_id"
    t.index ["service_id"], name: "index_channels_on_service_id"
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
    t.bigint "supplementary_kit_id", null: false
    t.boolean "is_complete_device"
    t.boolean "is_tape_rolling_mechanism"
    t.string "doc_url"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manufacturer_id"], name: "index_device_models_on_manufacturer_id"
    t.index ["measurement_class_id"], name: "index_device_models_on_measurement_class_id"
    t.index ["measurement_group_id"], name: "index_device_models_on_measurement_group_id"
    t.index ["supplementary_kit_id"], name: "index_device_models_on_supplementary_kit_id"
  end

  create_table "device_reg_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer "inventory_id"
    t.integer "serial_id"
    t.integer "tabel_id"
    t.bigint "device_model_id", null: false
    t.bigint "device_reg_group_id", null: false
    t.integer "year_of_production"
    t.integer "year_of_commissioning"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_model_id"], name: "index_devices_on_device_model_id"
    t.index ["device_reg_group_id"], name: "index_devices_on_device_reg_group_id"
    t.index ["inventory_id"], name: "index_devices_on_inventory_id", unique: true
    t.index ["tabel_id"], name: "index_devices_on_tabel_id", unique: true
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_divisions_on_organization_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "device_id", null: false
    t.datetime "inspection_date"
    t.string "inspection_conclusion"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id"], name: "index_inspections_on_device_id"
    t.index ["user_id"], name: "index_inspections_on_user_id"
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

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.bigint "building_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_rooms_on_building_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "name"
    t.string "ip_adress"
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
    t.integer "tabel_id"
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.string "avatar_url"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "buildings", "organizations"
  add_foreign_key "channels", "devices"
  add_foreign_key "channels", "rooms"
  add_foreign_key "channels", "servers"
  add_foreign_key "channels", "services"
  add_foreign_key "device_models", "manufacturers"
  add_foreign_key "device_models", "measurement_classes"
  add_foreign_key "device_models", "measurement_groups"
  add_foreign_key "device_models", "supplementary_kits"
  add_foreign_key "devices", "device_models"
  add_foreign_key "devices", "device_reg_groups"
  add_foreign_key "divisions", "organizations"
  add_foreign_key "inspections", "devices"
  add_foreign_key "inspections", "users"
  add_foreign_key "measurement_classes", "measurement_groups"
  add_foreign_key "rooms", "buildings"
  add_foreign_key "servers", "rooms"
  add_foreign_key "servers", "services"
  add_foreign_key "services", "buildings"
  add_foreign_key "services", "divisions"
  add_foreign_key "services", "organizations"
end
