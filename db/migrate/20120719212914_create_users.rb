class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      #t.string :password
      #t.string :password_confirmation
      t.string :password_digest
      t.string :gender
      t.integer :age
      t.string :remember_token
      t.timestamps
    end
    add_index :users, :name, :unique => true
    add_index :users, :email, :unique => true 
    add_index :users, :remember_token
  end
end
