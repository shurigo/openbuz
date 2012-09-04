class JobRequest < ActiveRecord::Base
  attr_accessible :address, :budget, :comment, :phone, :request_at, :skill_id, :status_id, :user_id
end
