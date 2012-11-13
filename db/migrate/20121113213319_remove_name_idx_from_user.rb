class RemoveNameIdxFromUser < ActiveRecord::Migration
  def up
    remove_index :users, :name
  end

  def down
    add_index :users, :name, :unique => true
  end
end
