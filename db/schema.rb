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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160223193522) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "articles", :force => true do |t|
    t.string   "author"
    t.string   "title",                                 :null => false
    t.string   "subtitle"
    t.text     "description"
    t.text     "summary"
    t.text     "content"
    t.date     "publication_date"
    t.integer  "publication_state",  :default => 0
    t.string   "slug"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "site_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "image_caption"
    t.boolean  "is_event",           :default => false
    t.text     "snippet"
    t.string   "calendar"
    t.string   "short_url"
  end

  add_index "articles", ["short_url"], :name => "index_articles_on_short_url"
  add_index "articles", ["slug"], :name => "index_articles_on_slug", :unique => true

  create_table "articles_categories", :force => true do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "attachment_files", :force => true do |t|
    t.string   "file_i4u_file_name"
    t.string   "file_i4u_content_type"
    t.integer  "file_i4u_file_size"
    t.datetime "file_i4u_updated_at"
    t.text     "summary"
    t.string   "slug"
    t.string   "name"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "attachment_files", ["slug"], :name => "index_attachment_files_on_slug", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "site_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["slug"], :name => "index_categories_on_slug", :unique => true

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.text     "text"
    t.integer  "comment_id"
    t.integer  "article_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "featured_contents", :force => true do |t|
    t.string   "name",               :null => false
    t.text     "body",               :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "site_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "slug"
  end

  add_index "featured_contents", ["slug"], :name => "index_featured_contents_on_slug", :unique => true

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "newsletter_subscribers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.boolean  "on_mail_chimp_list", :default => false
  end

  add_index "newsletter_subscribers", ["email"], :name => "index_newsletter_subscribers_on_email"
  add_index "newsletter_subscribers", ["id"], :name => "index_newsletter_subscribers_on_id"

  create_table "people", :force => true do |t|
    t.integer  "site_id"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "bio"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "position"
    t.string   "title"
  end

  add_index "people", ["site_id"], :name => "index_people_on_site_id"

  create_table "project_images", :force => true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "project_images", ["project_id"], :name => "index_project_images_on_project_id"

  create_table "project_technologies", :force => true do |t|
    t.integer  "project_id"
    t.integer  "technology_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "project_technologies", ["project_id"], :name => "index_project_technologies_on_project_id"
  add_index "project_technologies", ["technology_id"], :name => "index_project_technologies_on_technology_id"

  create_table "project_tools", :force => true do |t|
    t.integer  "project_id"
    t.integer  "tool_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "project_tools", ["project_id"], :name => "index_project_tools_on_project_id"
  add_index "project_tools", ["tool_id"], :name => "index_project_tools_on_tool_id"

  create_table "projects", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.text     "extended_description"
    t.string   "url"
    t.date     "started_at"
    t.date     "ended_at"
    t.boolean  "highlighted",                 :default => false
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "slug"
    t.boolean  "published",                   :default => false
  end

  add_index "projects", ["slug"], :name => "index_projects_on_slug", :unique => true

  create_table "services", :force => true do |t|
    t.integer  "site_id"
    t.string   "title"
    t.text     "summary"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "services", ["site_id"], :name => "index_services_on_site_id"

  create_table "site_sections", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "url"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "site_sections", ["site_id"], :name => "index_site_sections_on_site_id"
  add_index "site_sections", ["slug"], :name => "index_site_sections_on_slug", :unique => true

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.boolean  "live",         :default => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "technologies", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
    t.text     "description"
  end

  create_table "testimonies", :force => true do |t|
    t.string   "body"
    t.string   "video_id"
    t.boolean  "published",    :default => false
    t.datetime "published_at"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "text_snippets", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "text_snippets", ["site_id"], :name => "index_text_snippets_on_site_id"
  add_index "text_snippets", ["slug"], :name => "index_text_snippets_on_slug", :unique => true

  create_table "tips", :force => true do |t|
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
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "link"
  end

  add_index "tips", ["slug"], :name => "index_tips_on_slug", :unique => true

  create_table "tools", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "position"
    t.text     "description"
  end

  create_table "values", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "description"
    t.integer  "site_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
