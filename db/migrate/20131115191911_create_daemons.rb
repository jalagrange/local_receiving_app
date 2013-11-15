class CreateDaemons < ActiveRecord::Migration
  def change
    create_table :daemons do |t|
      t.text :Start, :null => false
      t.text :Info, :null => false
    end
  end
end
