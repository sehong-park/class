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

ActiveRecord::Schema.define(version: 20141017132052) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "courses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "courses", ["created_at"], name: "index_courses_on_created_at"
  add_index "courses", ["name"], name: "index_courses_on_name", unique: true

  create_table "example_answers", force: true do |t|
    t.string  "example_answer"
    t.integer "practice_id"
  end

  add_index "example_answers", ["practice_id"], name: "index_example_answers_on_practice_id"

  create_table "lectures", force: true do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "instructor"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "course_id"
    t.integer  "level"
  end

  add_index "lectures", ["course_id"], name: "index_lectures_on_course_id"
  add_index "lectures", ["name", "instructor", "level", "created_at"], name: "index_lectures_on_name_and_instructor_and_level_and_created_at"

  create_table "lectures_materials", force: true do |t|
    t.integer "lecture_id"
    t.integer "material_id"
  end

  add_index "lectures_materials", ["lecture_id", "material_id"], name: "index_lectures_materials_on_lecture_id_and_material_id"

  create_table "lessons", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lecture_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "description"
  end

  add_index "lessons", ["created_at"], name: "index_lessons_on_created_at"
  add_index "lessons", ["lecture_id"], name: "index_Lessons_on_lecture_id"

  create_table "materials", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "link"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "materials", ["created_at"], name: "index_materials_on_created_at"
  add_index "materials", ["name"], name: "index_materials_on_name"

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organizations", ["name", "created_at"], name: "index_organizations_on_name_and_created_at"

  create_table "practices", force: true do |t|
    t.integer  "lesson_id"
    t.string   "right_answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "question"
  end

  add_index "practices", ["lesson_id", "created_at"], name: "index_practices_on_lesson_id_and_created_at"

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",               default: false
    t.integer  "std_num"
    t.integer  "team_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["created_at", "updated_at"], name: "index_users_on_created_at_and_updated_at"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"
  add_index "users", ["std_num"], name: "index_users_on_std_num", unique: true
  add_index "users", ["team_id"], name: "index_users_on_team_id"

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
