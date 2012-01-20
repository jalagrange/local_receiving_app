class CreateHolas < ActiveRecord::Migration
  def change
    create_table :holas do |t|

      t.timestamps
    end
  end
end
