class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 30, :null => false
      t.string :email, :limit => 61, :null => false
      t.string :password, :limit => 30, :null => false
      t.integer :country, :limit => 2
      t.integer :state, :limit => 2
      t.string :language, :limit => 15
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
