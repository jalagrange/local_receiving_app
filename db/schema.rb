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

ActiveRecord::Schema.define(:version => 20120119214151) do

  create_table "daemons", :id => false, :force => true do |t|
    t.text "Start", :null => false
    t.text "Info",  :null => false
  end

  create_table "gammu", :id => false, :force => true do |t|
    t.integer "Version", :default => 0, :null => false
  end

  create_table "holas", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inbox", :primary_key => "ID", :force => true do |t|
    t.timestamp "UpdatedInDB",                                                           :null => false
    t.timestamp "ReceivingDateTime",                                                     :null => false
    t.text      "Text",                                                                  :null => false
    t.string    "SenderNumber",      :limit => 20, :default => "",                       :null => false
    t.string    "Coding",            :limit => 0,  :default => "Default_No_Compression", :null => false
    t.text      "UDH",                                                                   :null => false
    t.string    "SMSCNumber",        :limit => 20, :default => "",                       :null => false
    t.integer   "Class",                           :default => -1,                       :null => false
    t.text      "TextDecoded",                                                           :null => false
    t.text      "RecipientID",                                                           :null => false
    t.string    "Processed",         :limit => 0,  :default => "false",                  :null => false
  end

  create_table "outbox", :primary_key => "ID", :force => true do |t|
    t.timestamp "UpdatedInDB",                                                           :null => false
    t.timestamp "InsertIntoDB",                                                          :null => false
    t.timestamp "SendingDateTime",                                                       :null => false
    t.time      "SendBefore",                      :default => '2000-01-01 23:59:59',    :null => false
    t.time      "SendAfter",                       :default => '2000-01-01 00:00:00',    :null => false
    t.text      "Text"
    t.string    "DestinationNumber", :limit => 20, :default => "",                       :null => false
    t.string    "Coding",            :limit => 0,  :default => "Default_No_Compression", :null => false
    t.text      "UDH"
    t.integer   "Class",                           :default => -1
    t.text      "TextDecoded",                                                           :null => false
    t.string    "MultiPart",         :limit => 0,  :default => "false"
    t.integer   "RelativeValidity",                :default => -1
    t.string    "SenderID"
    t.timestamp "SendingTimeOut"
    t.string    "DeliveryReport",    :limit => 0,  :default => "default"
    t.text      "CreatorID",                                                             :null => false
  end

  add_index "outbox", ["SenderID"], :name => "outbox_sender"
  add_index "outbox", ["SendingDateTime", "SendingTimeOut"], :name => "outbox_date"

  create_table "outbox_multipart", :id => false, :force => true do |t|
    t.text    "Text"
    t.string  "Coding",           :limit => 0, :default => "Default_No_Compression", :null => false
    t.text    "UDH"
    t.integer "Class",                         :default => -1
    t.text    "TextDecoded"
    t.integer "ID",                            :default => 0,                        :null => false
    t.integer "SequencePosition",              :default => 1,                        :null => false
  end

  create_table "pbk", :primary_key => "ID", :force => true do |t|
    t.integer "GroupID", :default => -1, :null => false
    t.text    "Name",                    :null => false
    t.text    "Number",                  :null => false
  end

  create_table "pbk_groups", :primary_key => "ID", :force => true do |t|
    t.text "Name", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", :primary_key => "IMEI", :force => true do |t|
    t.text      "ID",                                          :null => false
    t.timestamp "UpdatedInDB",                                 :null => false
    t.timestamp "InsertIntoDB",                                :null => false
    t.timestamp "TimeOut",                                     :null => false
    t.string    "Send",         :limit => 0, :default => "no", :null => false
    t.string    "Receive",      :limit => 0, :default => "no", :null => false
    t.text      "Client",                                      :null => false
    t.integer   "Battery",                   :default => -1,   :null => false
    t.integer   "Signal",                    :default => -1,   :null => false
    t.integer   "Sent",                      :default => 0,    :null => false
    t.integer   "Received",                  :default => 0,    :null => false
  end

  create_table "sentitems", :id => false, :force => true do |t|
    t.timestamp "UpdatedInDB",                                                           :null => false
    t.timestamp "InsertIntoDB",                                                          :null => false
    t.timestamp "SendingDateTime",                                                       :null => false
    t.timestamp "DeliveryDateTime"
    t.text      "Text",                                                                  :null => false
    t.string    "DestinationNumber", :limit => 20, :default => "",                       :null => false
    t.string    "Coding",            :limit => 0,  :default => "Default_No_Compression", :null => false
    t.text      "UDH",                                                                   :null => false
    t.string    "SMSCNumber",        :limit => 20, :default => "",                       :null => false
    t.integer   "Class",                           :default => -1,                       :null => false
    t.text      "TextDecoded",                                                           :null => false
    t.integer   "ID",                              :default => 0,                        :null => false
    t.string    "SenderID",                                                              :null => false
    t.integer   "SequencePosition",                :default => 1,                        :null => false
    t.string    "Status",            :limit => 0,  :default => "SendingOK",              :null => false
    t.integer   "StatusError",                     :default => -1,                       :null => false
    t.integer   "TPMR",                            :default => -1,                       :null => false
    t.integer   "RelativeValidity",                :default => -1,                       :null => false
    t.text      "CreatorID",                                                             :null => false
  end

  add_index "sentitems", ["DeliveryDateTime"], :name => "sentitems_date"
  add_index "sentitems", ["DestinationNumber"], :name => "sentitems_dest"
  add_index "sentitems", ["SenderID"], :name => "sentitems_sender"
  add_index "sentitems", ["TPMR"], :name => "sentitems_tpmr"

end
