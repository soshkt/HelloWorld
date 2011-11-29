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

ActiveRecord::Schema.define(:version => 20110817083603) do

  create_table "activities", :force => true do |t|
    t.integer  "user_id",                                     :null => false
    t.integer  "activity_type", :limit => 1,                  :null => false
    t.integer  "is_private",    :limit => 1,   :default => 0
    t.string   "share_to",      :limit => 200
    t.integer  "parent_id"
    t.integer  "moment_id"
    t.integer  "photo_id"
    t.integer  "comment_id"
    t.datetime "created_at",                                  :null => false
    t.integer  "del_flg",       :limit => 1,   :default => 0, :null => false
    t.float    "lng"
    t.float    "lat"
  end

  create_table "allowed_users", :force => true do |t|
    t.string "from_site",    :limit => 100, :null => false
    t.string "from_site_id", :limit => 100, :null => false
  end

  create_table "avatars", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.string   "selection_file", :limit => 300
    t.integer  "width"
    t.integer  "height"
    t.string   "avatar_file",    :limit => 300
    t.integer  "x1"
    t.integer  "x2"
    t.integer  "y1"
    t.integer  "y2"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",                                 :null => false
    t.string   "commentable_type", :limit => 100,                :null => false
    t.integer  "user_id",                                        :null => false
    t.text     "content",                                        :null => false
    t.integer  "del_flg",          :limit => 1,   :default => 0, :null => false
    t.datetime "created_at",                                     :null => false
  end

  add_index "comments", ["id"], :name => "id", :unique => true

  create_table "devices", :force => true do |t|
    t.integer  "user_id",                                 :null => false
    t.string   "platform",   :limit => 50,                :null => false
    t.text     "token",                                   :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "del_flg",    :limit => 1,  :default => 0, :null => false
  end

  create_table "douban_events", :force => true do |t|
    t.string   "douban_id",          :limit => 200
    t.string   "douban_url",         :limit => 200
    t.text     "title"
    t.text     "summary"
    t.text     "content"
    t.datetime "starts_at",                         :null => false
    t.datetime "ends_at",                           :null => false
    t.float    "lng"
    t.float    "lat"
    t.text     "address"
    t.integer  "participants_count"
    t.integer  "wishers_count"
    t.string   "author_name",        :limit => 200
    t.string   "author_uri",         :limit => 200
  end

  add_index "douban_events", ["author_uri"], :name => "author_uri"
  add_index "douban_events", ["douban_url"], :name => "douban_id"

  create_table "douban_users", :force => true do |t|
    t.string  "douban_id",      :limit => 100
    t.string  "location",       :limit => 100
    t.string  "homepage",       :limit => 500
    t.integer "contacts_count"
    t.integer "reviews_count"
    t.integer "notes_count"
    t.integer "events_count"
    t.integer "scanned",        :limit => 1,   :default => 0, :null => false
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "from"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",                                 :null => false
    t.integer  "friend_id",                               :null => false
    t.string   "status",     :limit => 20,                :null => false
    t.datetime "updated_at"
    t.datetime "created_at",                              :null => false
    t.integer  "del_flg",    :limit => 1,  :default => 0
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.string   "code",          :limit => 200
    t.integer  "allowed_count",                :default => 1
    t.integer  "used_count",                   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.integer  "activity_id", :null => false
    t.datetime "created_at",  :null => false
  end

  create_table "moment_importations", :force => true do |t|
    t.string   "imported_type", :limit => 200, :null => false
    t.integer  "imported_id",                  :null => false
    t.integer  "moment_id",                    :null => false
    t.datetime "created_at"
  end

  create_table "moments", :force => true do |t|
    t.string   "name",                                  :limit => 200
    t.integer  "name_modified_by_user",                 :limit => 1,   :default => 0
    t.string   "address",                               :limit => 500
    t.string   "political_country",                     :limit => 500
    t.string   "political_administrative_area_level_1", :limit => 500
    t.string   "political_locality",                    :limit => 500
    t.string   "political_sublocality",                 :limit => 500
    t.float    "lng"
    t.float    "lat"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "modified_at"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "participants_count"
    t.integer  "photos_count"
    t.integer  "likes_count",                                          :default => 0, :null => false
    t.integer  "comments_count",                                       :default => 0, :null => false
    t.integer  "score"
    t.integer  "del_flg",                               :limit => 1,   :default => 0
    t.integer  "moment_type",                                          :default => 0
    t.integer  "display_order",                         :limit => 1,   :default => 0
  end

  create_table "notifications", :force => true do |t|
    t.integer  "user_id",                                       :null => false
    t.datetime "created_at",                                    :null => false
    t.integer  "is_read",           :limit => 1, :default => 0, :null => false
    t.string   "title"
    t.text     "html"
    t.integer  "notification_type"
    t.integer  "actor_id"
    t.integer  "subject1_id"
    t.integer  "subject2_id"
  end

  create_table "photos", :force => true do |t|
    t.integer  "photoable_id"
    t.string   "photoable_type",  :limit => 100
    t.integer  "parent_id"
    t.integer  "user_id"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type",    :limit => 100
    t.string   "filename",        :limit => 300
    t.string   "thumbnail",       :limit => 300
    t.string   "upload_filename", :limit => 300
    t.string   "orig_filename",   :limit => 300
    t.integer  "validated",       :limit => 1,   :default => 0
    t.integer  "isvalid",         :limit => 1,   :default => 0
    t.integer  "del_flg",                        :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "md5",             :limit => 50
  end

  add_index "photos", ["md5"], :name => "md5"
  add_index "photos", ["photoable_id", "photoable_type", "del_flg", "validated", "isvalid"], :name => "photoable_id"

  create_table "places", :force => true do |t|
    t.integer  "region_id"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.integer  "type_id"
    t.integer  "subtype_id"
    t.integer  "section_id"
    t.string   "name",         :limit => 300,                :null => false
    t.integer  "rentable",     :limit => 1,   :default => 0, :null => false
    t.string   "address",      :limit => 300
    t.string   "address_t",    :limit => 300
    t.string   "crossstreet",  :limit => 300
    t.string   "phone1",       :limit => 100
    t.string   "phone1_t",     :limit => 100
    t.string   "phone2",       :limit => 100
    t.integer  "got_lnglat",   :limit => 1,   :default => 0, :null => false
    t.integer  "user_id",                     :default => 0, :null => false
    t.integer  "price",                       :default => 0, :null => false
    t.datetime "created_at"
    t.integer  "v_flg",        :limit => 1,   :default => 0
    t.integer  "verified_flg", :limit => 1,   :default => 0
    t.integer  "del_flg",      :limit => 1,   :default => 0
  end

  add_index "places", ["subtype_id"], :name => "subtype_id"

  create_table "reports", :force => true do |t|
    t.integer  "report_type", :limit => 1
    t.integer  "user_id"
    t.string   "email"
    t.string   "user_ip",     :limit => 20
    t.string   "mobile",      :limit => 20
    t.text     "content"
    t.datetime "created_at"
  end

  create_table "settings", :force => true do |t|
    t.string  "skey",        :limit => 100
    t.integer "svalue"
    t.string  "description", :limit => 100
  end

  create_table "sina_moments", :force => true do |t|
    t.integer  "sina_id",         :limit => 8
    t.integer  "user_id"
    t.text     "content"
    t.float    "lng"
    t.float    "lat"
    t.integer  "comments_count"
    t.integer  "rt_count"
    t.string   "img_url",         :limit => 500
    t.datetime "sina_created_at"
    t.datetime "created_at"
  end

  create_table "sync_histories", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.string   "site",           :limit => 10,  :null => false
    t.integer  "activity_type",  :limit => 1
    t.integer  "activity_id"
    t.text     "content"
    t.string   "remote_site_id", :limit => 100
    t.datetime "created_at",                    :null => false
  end

  create_table "sysmessages", :force => true do |t|
    t.string "skey",   :limit => 100, :null => false
    t.string "svalue", :limit => 100, :null => false
  end

  create_table "user_auths", :force => true do |t|
    t.integer  "user_id",                                      :null => false
    t.string   "auth_site",      :limit => 10
    t.string   "auth_user_id",   :limit => 200
    t.string   "auth_user_name", :limit => 200
    t.string   "token",          :limit => 100
    t.string   "secret",         :limit => 100
    t.integer  "del_flg",        :limit => 1,   :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sync_necessary", :limit => 1,   :default => 0
  end

  add_index "user_auths", ["user_id"], :name => "user_id"

  create_table "user_belongings", :force => true do |t|
    t.integer  "user_id"
    t.string   "belongers",  :limit => 200
    t.datetime "created_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                                    :null => false
    t.integer  "gender",                    :limit => 1,   :default => 0, :null => false
    t.string   "email",                                                   :null => false
    t.string   "phone",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.integer  "reset_password"
    t.string   "reset_id",                  :limit => 40
    t.datetime "reset_at"
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "default_password",          :limit => 100
    t.string   "got_from",                  :limit => 10
    t.float    "lng"
    t.float    "lat"
    t.datetime "located_at"
  end

  create_table "vendor_avatars", :force => true do |t|
    t.integer  "user_id"
    t.string   "from_site",  :limit => 200
    t.string   "img_url",    :limit => 200
    t.integer  "del_flg",    :limit => 1,   :default => 0
    t.datetime "created_at"
  end

end
