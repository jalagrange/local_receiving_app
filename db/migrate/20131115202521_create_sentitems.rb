class CreateSentitems < ActiveRecord::Migration
  def change
    create_table :sentitems, :id => false do |t|
      t.timestamp :UpdatedInDB, :null => false
      t.timestamp :InsertIntoDB, :null => false, :default => 0
      t.timestamp :SendingDateTime, :null => false, :default => 0
      t.timestamp :DeliveryDateTime, :null => true
      t.text :Text, :null => false
      t.string :DestinationNumber, :null => false, :default => ''
      t.string :Coding, :null => false
      t.text :UDH, :null => false
      t.string :SMSCNumber, :null => false, :default => ''
      t.integer :Class, :null => false, :default => -1
      t.text :TextDecoded, :null => false, :default => ''
      t.integer :ID, :null => false, :default => 0
      t.string :SenderID, :null => false
      t.integer :SequencePosition, :null => false, :default => 1
      t.string :Status, :null => false
      t.integer :StatusError, :null => false, :default => -1
      t.integer :TPMR, :null => false, :default => -1
      t.integer :RelativeValidity, :null => false, :default => -1
      t.text :CreatorID, :null => false
    end

    add_index :sentitems, [:ID, :SequencePosition], :unique => true
    add_index :sentitems, :DeliveryDateTime
    add_index :sentitems, :TPMR
    add_index :sentitems, :DestinationNumber
    add_index :sentitems, :SenderID
  end
end
