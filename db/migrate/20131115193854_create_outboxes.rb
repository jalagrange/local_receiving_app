class CreateOutboxes < ActiveRecord::Migration
  def change
    create_table :outbox do |t|
      t.timestamp :UpdatedInDB, :null => false
      t.timestamp :InsertIntoDB, :null => false, :default => 0
      t.timestamp :SendingDateTime, :null => false, :default => 0
      t.time :SendBefore, :null => false, :default => '23:59:59'
      t.time :SendAfter, :null => false, :default => '00:00:00'
      t.text :Text
      t.string :DestinationNumber, :null => false, :default => ''
      t.string :Coding, :null => false
      t.text :UDH
      t.integer :Class, :default => -1
      t.text :TextDecoded, :null => false, :default => ''
      t.string :MultiPart, :default => 'false'
      t.integer :RelativeValidity, :default => -1
      t.string :SenderID, :default => 0
      t.timestamp :SendingTimeout, :null => true, :default => 0
      t.string :DeliveryReport, :default => 'default'
      t.text :CreatorID, :null => false
    end

    add_index :outbox, [:SendingDateTime, :SendingTimeOut]
    add_index :outbox, :SenderID
  end
end
