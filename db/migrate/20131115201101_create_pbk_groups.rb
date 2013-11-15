class CreatePbkGroups < ActiveRecord::Migration
  def change
    create_table :pbk_groups do |t|
      t.text :Name, :null => false
    end
  end
end
