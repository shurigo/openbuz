class ContactDetails < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :address, :city, :country

  validates :address, length: { maximum: 140 }

  validates :city, presence: true, length: { maximum: 100 }

  validates :country, presence: true, length: { maximum: 100 }
end
