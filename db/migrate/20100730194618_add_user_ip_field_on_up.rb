class AddUserIpFieldOnUp < ActiveRecord::Migration
  def self.up
    add_column :ups, :user_ip, :string
  end

  def self.down
  end
end
