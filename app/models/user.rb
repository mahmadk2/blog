class User < ActiveRecord::Base
	has_many :articles
	before_save { self.email = email.downcase }

 validates :username, presence: true, uniqueness: {case_sensitive: false}, 
                                      length: { minimum: 3, maximum: 25 }


            VALID_EMAIL_REGEX = /([A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4})/i
 validates :email, presence: true, uniqueness: { case_sensitive: false},
                                     format: {with: VALID_EMAIL_REGEX }, 
                                               length: { maximum: 100 }

                                               
 has_secure_password
end