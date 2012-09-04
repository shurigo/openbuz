class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string  :name
      t.boolean :notify
      t.string  :address
      t.decimal :price
      t.string  :price_measure
      t.string  :description
      t.string  :media
      t.timestamps
    end
  end
end
