class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :age, :gender
  has_secure_password
  has_many :services
  has_one  :contact_details
  has_many :skill

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 
  validates :name, :presence => true,
            :length => { :maximum => 50 },
            :uniqueness => { :case_sensitive => false }
  
  validates :email, :presence => true,
	    :format => { :with => email_regex },
	    :uniqueness => { :case_sensitive => false }
  
  validates :gender, :presence => true, 
            :length=> { :maximum => 1 }
 
  validates :password, presence: true,
            length: { minimum: 6 }
  validates :password_confirmation, :presence => true

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
