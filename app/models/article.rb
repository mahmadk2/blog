class Article < ActiveRecord::Base

	validates :title, presence: true, length: {minimum: 5, maximum: 15}
	validates :description, presence: true, length: {minimum: 12, maximum:110} 

end