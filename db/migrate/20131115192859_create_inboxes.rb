class CreateInboxes < ActiveRecord::Migration
  def change
    create_table :inboxes do |t|
      t.timestamp :UpdatedInDB, :null => false
      t.timestamp :ReceivingDateTime, :null => false, 
                                      :default => 0
      t.text :Text, :null => false
      t.string :SenderNumber, :null => false, :default => ''
      t.string :Coding
      t.text :UDH, :null => false
      t.string :SMSCNumber, :null => false, :default => ''
      t.integer :Class, :null => false, :default => -1
      t.text :TextDecoded, :null => false, :default => ''
      t.text :RecipientID, :null => false
      t.string :Processed, :null => false, :default => 'false'
    end
  end
end
