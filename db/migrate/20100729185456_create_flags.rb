class CreateFlags < ActiveRecord::Migration
  def self.up
    create_table :flags do |t|
      t.integer :definition_id, :null => false
      t.integer :user_id, :null => false
      t.string :obs, :limit => 250
      t.timestamps
    end
  end
  
  def self.down
    drop_table :flags
  end
end
