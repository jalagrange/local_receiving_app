class CreateOutboxTemps < ActiveRecord::Migration
  def change
    create_table :outbox_temps do |t|
      t.integer :outbox_id, :null => false, :default => 0

      t.timestamps
    end

    add_index :outbox_temps, :outbox_id, :unique => true
  end
end
