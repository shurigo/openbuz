class Feedback < ActiveRecord::Base
  attr_accessible :my_user_id, :rating, :skill_id, :text, :user_id, :user_rating
end
