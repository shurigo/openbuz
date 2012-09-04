class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :name_first
      t.string :name_last
      t.string :sex
      t.integer :age
      t.string :photo
      t.boolean :available
      t.timestamps
    end
    add_index :users, :name, :unique => true
    add_index :users, :email, :unique => true 
  end
end
