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

ActiveRecord::Schema.define(version: 20161025184908) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.text     "body"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "namespace",     limit: 255
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_admin_notes_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string   "author",             limit: 255
    t.string   "title",              limit: 255,                 null: false
    t.string   "subtitle",           limit: 255
    t.text     "description"
    t.text     "summary"
    t.text     "content"
    t.date     "publication_date"
    t.integer  "publication_state",              default: 0
    t.string   "slug",               limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "site_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "image_caption",      limit: 255
    t.boolean  "is_event",                       default: false
    t.text     "snippet"
    t.string   "short_url",          limit: 255
    t.index ["short_url"], name: "index_articles_on_short_url"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "articles_categories", force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "attachment_files", force: :cascade do |t|
    t.string   "file_i4u_file_name",    limit: 255
    t.string   "file_i4u_content_type", limit: 255
    t.integer  "file_i4u_file_size"
    t.datetime "file_i4u_updated_at"
    t.text     "summary"
    t.string   "slug",                  limit: 255
    t.string   "name",                  limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["slug"], name: "index_attachment_files_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "slug",       limit: 255
    t.integer  "site_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.string   "website",    limit: 255
    t.text     "text"
    t.integer  "comment_id"
    t.integer  "article_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "featured_contents", force: :cascade do |t|
    t.string   "name",               limit: 255, null: false
    t.text     "body",                           null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "site_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "slug",               limit: 255
    t.index ["slug"], name: "index_featured_contents_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "landing_page_contents", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "title",       limit: 255
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "landing_page_items", force: :cascade do |t|
    t.integer  "position"
    t.integer  "landing_page_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "landing_page_content_id"
    t.index ["landing_page_id", "landing_page_content_id"], name: "landing_page_items_main_idx"
    t.index ["landing_page_id"], name: "index_landing_page_items_on_landing_page_id"
  end

  create_table "landing_pages", force: :cascade do |t|
    t.string   "folder",      limit: 255
    t.string   "slug",        limit: 255
    t.string   "title",       limit: 255
    t.string   "heading",     limit: 255
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "summary"
    t.index ["folder", "slug"], name: "index_landing_pages_on_folder_and_slug"
  end

  create_table "landing_technologies", force: :cascade do |t|
    t.integer  "landing_page_id"
    t.integer  "technology_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["landing_page_id"], name: "index_landing_technologies_on_landing_page_id"
    t.index ["technology_id"], name: "index_landing_technologies_on_technology_id"
  end

  create_table "newsletter_subscribers", force: :cascade do |t|
    t.string   "email",              limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "on_mail_chimp_list",             default: false
    t.index ["email"], name: "index_newsletter_subscribers_on_email"
    t.index ["id"], name: "index_newsletter_subscribers_on_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "first_name",         limit: 255
    t.string   "last_name",          limit: 255
    t.text     "bio"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "position"
    t.string   "title",              limit: 255
    t.index ["site_id"], name: "index_people_on_site_id"
  end

  create_table "project_images", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["project_id"], name: "index_project_images_on_project_id"
  end

  create_table "project_items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_project_items_on_project_id"
  end

  create_table "project_technologies", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "technology_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["project_id"], name: "index_project_technologies_on_project_id"
    t.index ["technology_id"], name: "index_project_technologies_on_technology_id"
  end

  create_table "project_tools", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "tool_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tools_on_project_id"
    t.index ["tool_id"], name: "index_project_tools_on_tool_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name",                        limit: 255
    t.text     "summary"
    t.text     "description"
    t.text     "extended_description"
    t.string   "url",                         limit: 255
    t.date     "started_at"
    t.date     "ended_at"
    t.boolean  "highlighted",                             default: false
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "image_file_name",             limit: 255
    t.string   "image_content_type",          limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "featured_image_file_name",    limit: 255
    t.string   "featured_image_content_type", limit: 255
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "slug",                        limit: 255
    t.boolean  "published",                               default: false
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "services", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "title",              limit: 255
    t.text     "summary"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["site_id"], name: "index_services_on_site_id"
  end

  create_table "site_sections", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["site_id"], name: "index_site_sections_on_site_id"
    t.index ["slug"], name: "index_site_sections_on_slug", unique: true
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "abbreviation", limit: 255
    t.boolean  "live",                     default: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "position"
    t.text     "description"
  end

  create_table "testimonies", force: :cascade do |t|
    t.string   "body",         limit: 255
    t.string   "video_id",     limit: 255
    t.boolean  "published",                default: false
    t.datetime "published_at"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "text_snippets", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name",               limit: 255
    t.string   "title",              limit: 255
    t.text     "body"
    t.string   "slug",               limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["site_id"], name: "index_text_snippets_on_site_id"
    t.index ["slug"], name: "index_text_snippets_on_slug", unique: true
  end

  create_table "tips", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.integer  "tip_type"
    t.text     "description"
    t.text     "content"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "published_at"
    t.string   "slug",               limit: 255
    t.integer  "site_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "link",               limit: 255
    t.index ["slug"], name: "index_tips_on_slug", unique: true
  end

  create_table "tools", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "position"
    t.text     "description"
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "title",              limit: 255
    t.text     "profile"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "profile_url",        limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "title",              limit: 255,                 null: false
    t.string   "subtitle",           limit: 255
    t.text     "summary"
    t.integer  "price"
    t.integer  "discount"
    t.date     "initial_date"
    t.text     "topics"
    t.text     "addressed_to"
    t.string   "slug",               limit: 255
    t.integer  "trainer_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "days_time",          limit: 255
    t.string   "calendar",           limit: 255
    t.string   "payment",            limit: 255
    t.boolean  "disable_payment",                default: false
    t.string   "addressed_to_title", limit: 255
    t.string   "requirements_title", limit: 255
    t.text     "requirements"
    t.string   "short_url",          limit: 255
    t.boolean  "presale"
    t.string   "presale_title"
    t.integer  "presale_price"
    t.integer  "presale_discount"
    t.string   "presale_payment"
    t.date     "presale_expiration"
    t.index ["short_url"], name: "index_trainings_on_short_url"
    t.index ["slug"], name: "index_trainings_on_slug", unique: true
    t.index ["trainer_id"], name: "index_trainings_on_trainer_id"
  end

  create_table "values", force: :cascade do |t|
    t.string   "title",              limit: 255
    t.string   "subtitle",           limit: 255
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
