class CreateSiglas < ActiveRecord::Migration
  def self.up
    create_table :siglas do |t|
      t.string :sigla
      t.timestamps
    end
  end
  
  def self.down
    drop_table :siglas
  end
end
