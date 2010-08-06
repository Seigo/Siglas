class AddAcceptanceFieldOnFlags < ActiveRecord::Migration
  def self.up
    add_column :flags, :accepted, :boolean, :default => nil
  end

  def self.down
  end
end
