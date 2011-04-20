class CreateUps < ActiveRecord::Migration
  def self.up
    create_table :ups do |t|
      t.integer :definition_id, :null => false
      t.integer :user_id, :null => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :ups
  end
end
