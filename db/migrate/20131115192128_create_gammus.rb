class CreateGammus < ActiveRecord::Migration
  def change
    create_table :gammu do |t|
      t.integer :Version, :null => false, :default => 0
    end
  end
end
