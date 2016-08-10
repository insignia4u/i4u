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

ActiveRecord::Schema.define(version: 20160810130552) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string   "author"
    t.string   "title",                              null: false
    t.string   "subtitle"
    t.text     "description"
    t.text     "summary"
    t.text     "content"
    t.date     "publication_date"
    t.integer  "publication_state",  default: 0
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_caption"
    t.boolean  "is_event",           default: false
    t.text     "snippet"
    t.string   "short_url"
    t.index ["short_url"], name: "index_articles_on_short_url"
    t.index ["slug"], name: "index_articles_on_slug", unique: true
  end

  create_table "articles_categories", force: :cascade do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "attachment_files", force: :cascade do |t|
    t.string   "file_i4u_file_name"
    t.string   "file_i4u_content_type"
    t.integer  "file_i4u_file_size"
    t.datetime "file_i4u_updated_at"
    t.text     "summary"
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_attachment_files_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.text     "text"
    t.integer  "comment_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["comment_id"], name: "index_comments_on_comment_id"
  end

  create_table "featured_contents", force: :cascade do |t|
    t.string   "name",               null: false
    t.text     "body",               null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.index ["slug"], name: "index_featured_contents_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 40
    t.datetime "created_at"
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", unique: true
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "landing_page_contents", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "landing_page_items", force: :cascade do |t|
    t.integer  "position"
    t.integer  "landing_page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "landing_page_content_id"
    t.index ["landing_page_id", "landing_page_content_id"], name: "landing_page_items_main_idx"
    t.index ["landing_page_id"], name: "index_landing_page_items_on_landing_page_id"
  end

  create_table "landing_pages", force: :cascade do |t|
    t.string   "folder"
    t.string   "slug"
    t.string   "title"
    t.string   "heading"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["folder", "slug"], name: "index_landing_pages_on_folder_and_slug"
  end

  create_table "newsletter_subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "on_mail_chimp_list", default: false
    t.index ["email"], name: "index_newsletter_subscribers_on_email"
    t.index ["id"], name: "index_newsletter_subscribers_on_id"
  end

  create_table "people", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "position"
    t.string   "title"
    t.index ["site_id"], name: "index_people_on_site_id"
  end

  create_table "project_images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["project_id"], name: "index_project_images_on_project_id"
  end

  create_table "project_technologies", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "technology_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["project_id"], name: "index_project_technologies_on_project_id"
    t.index ["technology_id"], name: "index_project_technologies_on_technology_id"
  end

  create_table "project_tools", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "tool_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["project_id"], name: "index_project_tools_on_project_id"
    t.index ["tool_id"], name: "index_project_tools_on_tool_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.text     "extended_description"
    t.string   "url"
    t.date     "started_at"
    t.date     "ended_at"
    t.boolean  "highlighted",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "slug"
    t.boolean  "published",                   default: false
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "services", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "title"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["site_id"], name: "index_services_on_site_id"
  end

  create_table "site_sections", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "url"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["site_id"], name: "index_site_sections_on_site_id"
    t.index ["slug"], name: "index_site_sections_on_slug", unique: true
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.boolean  "live",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.text     "description"
  end

  create_table "testimonies", force: :cascade do |t|
    t.string   "body"
    t.string   "video_id"
    t.boolean  "published",    default: false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_snippets", force: :cascade do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["site_id"], name: "index_text_snippets_on_site_id"
    t.index ["slug"], name: "index_text_snippets_on_slug", unique: true
  end

  create_table "tips", force: :cascade do |t|
    t.string   "title"
    t.integer  "tip_type"
    t.text     "description"
    t.text     "content"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "published_at"
    t.string   "slug"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.index ["slug"], name: "index_tips_on_slug", unique: true
  end

  create_table "tools", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.text     "description"
  end

  create_table "trainers", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "profile"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "profile_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "title",                              null: false
    t.string   "subtitle"
    t.text     "summary"
    t.integer  "price"
    t.integer  "discount"
    t.date     "initial_date"
    t.text     "topics"
    t.text     "addressed_to"
    t.string   "slug"
    t.integer  "trainer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "days_time"
    t.string   "calendar"
    t.string   "payment"
    t.boolean  "disable_payment",    default: false
    t.string   "addressed_to_title"
    t.string   "requirements_title"
    t.text     "requirements"
    t.string   "short_url"
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
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
