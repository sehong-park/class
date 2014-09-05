class User < ActiveRecord::Base
  
  #validation
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true
  
end
