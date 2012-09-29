class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :age, :gender
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
  
  validates :gender, :length=> { :maximum => 1 }
  
  before_save { |user| user.email = email.downcase }
end
