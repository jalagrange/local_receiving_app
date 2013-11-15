class CreatePbks < ActiveRecord::Migration
  def change
    create_table :pbk do |t|
      t.integer :GroupID, :null => false, :default => -1
      t.text :Name, :null => false
      t.text :Number, :null => false
    end
  end
end
