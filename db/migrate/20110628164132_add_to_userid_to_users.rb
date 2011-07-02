class AddToUseridToUsers < ActiveRecord::Migration
  def self.up
    add_column :users , :userid, :string 
  end

  def self.down
    remove_column :users, :userid, :string
  end
end
