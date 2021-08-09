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

ActiveRecord::Schema.define(version: 2021_08_09_061052) do

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "brand_name"
    t.string "price"
    t.string "description"
    t.string "product_image"
    t.integer "shop_info_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_info_id"], name: "index_products_on_shop_info_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "shop_infos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "service"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_shop_infos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone", limit: 10
    t.integer "work_roles_id"
    t.index ["work_roles_id"], name: "index_users_on_work_roles_id"
  end

  create_table "work_roles", force: :cascade do |t|
    t.string "role_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "users", "work_roles", column: "work_roles_id"
end
