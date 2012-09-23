class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :text
      t.integer :user_id
      t.integer :my_user_id
      t.integer :skill_id
      t.decimal :rating
      t.integer :user_rating

      t.timestamps
    end
  end
end
