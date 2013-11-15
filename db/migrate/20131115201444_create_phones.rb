class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones, :id => false do |t|
      t.text :ID, :null => false
      t.timestamp :UpdatedInDB, :null => false
      t.timestamp :InsertIntoDB, :null => false, :default => Date.new(0,0,0)
      t.timestamp :TimeOut, :null => false, :default => Date.new(0,0,0)
      t.string :Send, :null => false, :default => 'no'
      t.string :Receive, :null => false, :default => 'no'
      t.string :IMEI, :null => false, :primary_key
      t.text :Client, :null => false
      t.integer :Battery, :null => false, :default => -1
      t.integer :Signal, :null => false, :default => -1
      t.integer :Sent, :null => false, :default => 0
      t.integer :Received, :null => false, :default => 0
    end
  end
end
