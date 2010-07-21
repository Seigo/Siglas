class CreateDefinitions < ActiveRecord::Migration
  def self.up
    create_table :definitions do |t|
      t.integer :id_sigla
      t.string :definition
      t.integer :creator_id
      t.string :language
      t.timestamps
    end
  end
  
  def self.down
    drop_table :definitions
  end
end
