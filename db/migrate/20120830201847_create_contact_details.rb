class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_details do |t|
      t.string :country
      t.string :city
      t.string :address

      t.timestamps
    end
  end
end
