# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name_first, :name_last,  :age, :sex, :photo
  
  has_many :services
  has_one  :contact_details
  has_many :skill

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  validates :name, :presence => true,
            :length => { :maximum =>50 },
            :uniqueness => { :case_sensitive => false }
  
  validates :email, :presence => true,
	    :format => { :with => email_regex },
	    :uniqueness => { :case_sensitive => false }
  
  validates :sex, :length=> { :maximum => 1 }
  
  before_save { |user| user.email = email.downcase }
end
