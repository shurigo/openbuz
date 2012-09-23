class CreateJobRequests < ActiveRecord::Migration
  def change
    create_table :job_requests do |t|
      t.integer :user_id
      t.integer :skill_id
      t.datetime :request_at
      t.string :address
      t.string :comment
      t.string :phone
      t.decimal :budget
      t.string :status_id

      t.timestamps
    end
  end
end
