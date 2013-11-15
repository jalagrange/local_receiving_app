class CreateOutboxMultiparts < ActiveRecord::Migration
  def change
    create_table :outbox_multipart, :id => false do |t|
      t.integer :ID, :null => false, :default => 0
      t.text :Text
      t.string :Encoding
      t.text :UDH
      t.integer :Class, :default => -1
      t.text :TextDecoded
      t.integer :SequencePosition, :null => false, :default => 1
    end

    add_index :outbox_multipart, [:ID, :SequencePosition], :unique => true
  end
end
