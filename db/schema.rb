# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140330030901) do

  create_table "categories", force: true do |t|
    t.integer "cate_id"
    t.string  "name"
    t.integer "parent_id"
    t.integer "status"
  end

  create_table "cities", force: true do |t|
    t.integer "serialId"
    t.string  "cityId"
    t.string  "cityName"
    t.string  "cityUpId"
    t.integer "cityUpIdNum"
    t.string  "cityPath"
    t.string  "cityType"
    t.integer "cityTypeNum"
    t.string  "shortName"
    t.string  "spell"
    t.string  "areaId"
    t.string  "postCode"
  end

  add_index "cities", ["cityId"], name: "index_cities_on_cityId", using: :btree
  add_index "cities", ["cityUpId"], name: "index_cities_on_cityUpId", using: :btree
  add_index "cities", ["serialId"], name: "index_cities_on_serialId", using: :btree

  create_table "concats", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "sex"
    t.string   "mobile"
    t.string   "phone"
    t.integer  "photo_id"
    t.integer  "province_id"
    t.integer  "city_id"
    t.integer  "district_id"
    t.string   "address"
    t.string   "fax"
    t.string   "post_code"
    t.string   "email"
    t.string   "qq"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "dept"
    t.string   "staff"
  end

  add_index "concats", ["mobile"], name: "index_concats_on_mobile", using: :btree
  add_index "concats", ["phone"], name: "index_concats_on_phone", using: :btree
  add_index "concats", ["user_id"], name: "index_concats_on_user_id", unique: true, using: :btree

  create_table "districts", force: true do |t|
    t.string  "serialId"
    t.string  "districtId"
    t.string  "districtName"
    t.string  "districtUpId"
    t.integer "districtUpIdNum"
    t.string  "districtPath"
    t.string  "districtType"
    t.integer "districtTypeNum"
    t.string  "shortName"
    t.string  "spell"
    t.string  "areaId"
    t.string  "postCode"
  end

  add_index "districts", ["districtId"], name: "index_districts_on_districtId", using: :btree
  add_index "districts", ["districtUpId"], name: "index_districts_on_districtUpId", using: :btree
  add_index "districts", ["serialId"], name: "index_districts_on_serialId", using: :btree

  create_table "firm_categories", force: true do |t|
    t.integer  "firm_info_id"
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "firm_categories", ["firm_info_id"], name: "index_firm_categories_on_firm_info_id", using: :btree
  add_index "firm_categories", ["parent_id"], name: "index_firm_categories_on_parent_id", using: :btree

  create_table "firm_infos", force: true do |t|
    t.integer  "concat_id"
    t.string   "firm_name"
    t.string   "category"
    t.string   "firm_nature"
    t.string   "business_model"
    t.string   "web"
    t.string   "address"
    t.string   "firm_owner"
    t.integer  "owner_card_id"
    t.date     "found_at"
    t.integer  "staff_count"
    t.float    "found_capital"
    t.string   "found_bank"
    t.integer  "bank_card_id"
    t.string   "brand"
    t.float    "turnover"
    t.string   "centify"
    t.string   "quality_control"
    t.string   "OEM_centify"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "main_product"
    t.string   "attr_a"
    t.string   "attr_b"
    t.string   "attr_c"
    t.string   "attr_d"
    t.string   "attr_e"
    t.string   "province_id"
    t.string   "city_id"
    t.string   "district_id"
    t.string   "found_address"
    t.string   "firm_area"
    t.string   "firm_staff"
    t.string   "tech_staff"
    t.string   "main_market"
    t.string   "main_customer"
  end

  add_index "firm_infos", ["brand"], name: "index_firm_infos_on_brand", using: :btree
  add_index "firm_infos", ["concat_id"], name: "index_firm_infos_on_concat_id", unique: true, using: :btree
  add_index "firm_infos", ["firm_name"], name: "index_firm_infos_on_firm_name", using: :btree
  add_index "firm_infos", ["web"], name: "index_firm_infos_on_web", using: :btree

  create_table "messages", force: true do |t|
    t.integer  "firm_info_id"
    t.string   "title"
    t.string   "concat"
    t.string   "phone"
    t.string   "mobile"
    t.string   "address"
    t.string   "post_code"
    t.string   "email"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "firm_info_id"
    t.string   "photo_type"
    t.string   "photo_name"
    t.string   "photo_path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  add_index "photos", ["firm_info_id"], name: "index_photos_on_firm_info_id", using: :btree
  add_index "photos", ["photo_name"], name: "index_photos_on_photo_name", using: :btree
  add_index "photos", ["photo_path"], name: "index_photos_on_photo_path", using: :btree
  add_index "photos", ["photo_type"], name: "index_photos_on_photo_type", using: :btree
  add_index "photos", ["product_id"], name: "index_photos_on_product_id", using: :btree

  create_table "product_calculates", force: true do |t|
    t.integer  "product_id"
    t.string   "ceil"
    t.integer  "count"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_calculates", ["product_id"], name: "index_product_calculates_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.integer  "firm_info_id"
    t.integer  "firm_category_id"
    t.integer  "product_calculate_id"
    t.integer  "name"
    t.integer  "category_id"
    t.string   "title"
    t.integer  "sum_count"
    t.string   "package_info"
    t.string   "special"
    t.string   "package_price"
    t.string   "order_info"
    t.string   "batch_info"
    t.string   "trade"
    t.string   "after_sale"
    t.integer  "min_order"
    t.string   "content"
    t.string   "captcha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "products", ["firm_category_id"], name: "index_products_on_firm_category_id", using: :btree
  add_index "products", ["firm_info_id"], name: "index_products_on_firm_info_id", using: :btree
  add_index "products", ["product_calculate_id"], name: "index_products_on_product_calculate_id", using: :btree
  add_index "products", ["status"], name: "index_products_on_status", using: :btree

  create_table "provinces", force: true do |t|
    t.integer "serialId"
    t.string  "provinceId"
    t.string  "provinceName"
    t.string  "provinceUpId"
    t.integer "provinceUpIdNum"
    t.string  "provincePath"
    t.string  "provinceType"
    t.integer "provinceTypeNum"
    t.string  "shortName"
    t.string  "spell"
    t.string  "areaId"
    t.string  "postCode"
  end

  add_index "provinces", ["provinceId"], name: "index_provinces_on_provinceId", using: :btree
  add_index "provinces", ["provinceUpId"], name: "index_provinces_on_provinceUpId", using: :btree

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key", using: :btree

  create_table "sys_codes", force: true do |t|
    t.string "code_type"
    t.string "code"
    t.string "value"
  end

  add_index "sys_codes", ["code"], name: "index_sys_codes_on_code", using: :btree
  add_index "sys_codes", ["code_type"], name: "index_sys_codes_on_code_type", using: :btree
  add_index "sys_codes", ["value"], name: "index_sys_codes_on_value", using: :btree

  create_table "users", force: true do |t|
    t.string   "username",               default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "password",               default: "", null: false
    t.integer  "user_type",              default: 0,  null: false
    t.string   "mobile"
    t.string   "phone"
    t.integer  "firm_info_id"
    t.integer  "status",                 default: 0,  null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["firm_info_id"], name: "index_users_on_firm_info_id", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["status"], name: "index_users_on_status", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
