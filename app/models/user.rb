class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :age, :gender
  has_secure_password
  has_many :services
  has_one  :contact_details
  has_many :skills

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  validates :email, :presence => true,
	    :format => { :with => email_regex },
	    :uniqueness => { :case_sensitive => false }
  
  validates :password, presence: true,
            length: { minimum: 6 }

  before_save { self.email.downcase! }
  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
