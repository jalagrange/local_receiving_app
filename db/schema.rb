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

ActiveRecord::Schema.define(:version => 20131115202521) do

  create_table "daemons", :force => true do |t|
    t.text "Start", :null => false
    t.text "Info",  :null => false
  end

  create_table "gammu", :force => true do |t|
    t.integer "Version", :default => 0, :null => false
  end

  create_table "holas", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inboxes", :force => true do |t|
    t.datetime "UpdatedInDB",                            :null => false
    t.datetime "ReceivingDateTime",                      :null => false
    t.text     "Text",                                   :null => false
    t.string   "SenderNumber",      :default => "",      :null => false
    t.string   "Coding"
    t.text     "UDH",                                    :null => false
    t.string   "SMSCNumber",        :default => "",      :null => false
    t.integer  "Class",             :default => -1,      :null => false
    t.text     "TextDecoded",                            :null => false
    t.text     "RecipientID",                            :null => false
    t.string   "Processed",         :default => "false", :null => false
  end

  create_table "outbox", :force => true do |t|
    t.datetime "UpdatedInDB",                                          :null => false
    t.datetime "InsertIntoDB",                                         :null => false
    t.datetime "SendingDateTime",                                      :null => false
    t.time     "SendBefore",        :default => '2000-01-01 23:59:59', :null => false
    t.time     "SendAfter",         :default => '2000-01-01 00:00:00', :null => false
    t.text     "Text"
    t.string   "DestinationNumber", :default => "",                    :null => false
    t.string   "Coding",                                               :null => false
    t.text     "UDH"
    t.integer  "Class",             :default => -1
    t.text     "TextDecoded",                                          :null => false
    t.string   "MultiPart",         :default => "false"
    t.integer  "RelativeValidity",  :default => -1
    t.string   "SenderID",          :default => "0"
    t.datetime "SendingTimeout"
    t.string   "DeliveryReport",    :default => "default"
    t.text     "CreatorID",                                            :null => false
  end

  add_index "outbox", ["SenderID"], :name => "index_outbox_on_SenderID"
  add_index "outbox", ["SendingDateTime", "SendingTimeout"], :name => "index_outbox_on_SendingDateTime_and_SendingTimeOut"

  create_table "outbox_multipart", :id => false, :force => true do |t|
    t.integer "ID",               :default => 0,  :null => false
    t.text    "Text"
    t.string  "Encoding"
    t.text    "UDH"
    t.integer "Class",            :default => -1
    t.text    "TextDecoded"
    t.integer "SequencePosition", :default => 1,  :null => false
  end

  add_index "outbox_multipart", ["ID", "SequencePosition"], :name => "index_outbox_multipart_on_ID_and_SequencePosition", :unique => true

  create_table "outbox_temps", :force => true do |t|
    t.integer  "outbox_id",  :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "outbox_temps", ["outbox_id"], :name => "index_outbox_temps_on_outbox_id", :unique => true

  create_table "pbk", :force => true do |t|
    t.integer "GroupID", :default => -1, :null => false
    t.text    "Name",                    :null => false
    t.text    "Number",                  :null => false
  end

  create_table "pbk_groups", :force => true do |t|
    t.text "Name", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :id => false, :force => true do |t|
    t.text     "ID",                             :null => false
    t.datetime "UpdatedInDB",                    :null => false
    t.datetime "InsertIntoDB",                   :null => false
    t.datetime "TimeOut",                        :null => false
    t.string   "Send",         :default => "no", :null => false
    t.string   "Receive",      :default => "no", :null => false
    t.string   "IMEI",                           :null => false
    t.text     "Client",                         :null => false
    t.integer  "Battery",      :default => -1,   :null => false
    t.integer  "Signal",       :default => -1,   :null => false
    t.integer  "Sent",         :default => 0,    :null => false
    t.integer  "Received",     :default => 0,    :null => false
  end

  add_index "phones", ["IMEI"], :name => "index_phones_on_IMEI", :unique => true

  create_table "sentitems", :id => false, :force => true do |t|
    t.datetime "UpdatedInDB",                       :null => false
    t.datetime "InsertIntoDB",                      :null => false
    t.datetime "SendingDateTime",                   :null => false
    t.datetime "DeliveryDateTime"
    t.text     "Text",                              :null => false
    t.string   "DestinationNumber", :default => "", :null => false
    t.string   "Coding",                            :null => false
    t.text     "UDH",                               :null => false
    t.string   "SMSCNumber",        :default => "", :null => false
    t.integer  "Class",             :default => -1, :null => false
    t.text     "TextDecoded",                       :null => false
    t.integer  "ID",                :default => 0,  :null => false
    t.string   "SenderID",                          :null => false
    t.integer  "SequencePosition",  :default => 1,  :null => false
    t.string   "Status",                            :null => false
    t.integer  "StatusError",       :default => -1, :null => false
    t.integer  "TPMR",              :default => -1, :null => false
    t.integer  "RelativeValidity",  :default => -1, :null => false
    t.text     "CreatorID",                         :null => false
  end

  add_index "sentitems", ["DeliveryDateTime"], :name => "index_sentitems_on_DeliveryDateTime"
  add_index "sentitems", ["DestinationNumber"], :name => "index_sentitems_on_DestinationNumber"
  add_index "sentitems", ["ID", "SequencePosition"], :name => "index_sentitems_on_ID_and_SequencePosition", :unique => true
  add_index "sentitems", ["SenderID"], :name => "index_sentitems_on_SenderID"
  add_index "sentitems", ["TPMR"], :name => "index_sentitems_on_TPMR"

end
