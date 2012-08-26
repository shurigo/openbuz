class User < ActiveRecord::Base
  has_many :services
  attr_accessible :email, :name
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :presence => true,
            :length => { :maximum =>50 },
            :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true,
	    :format => { :with => email_regex },
	    :uniqueness => { :case_sensitive => false }
end
