class Person < ActiveRecord::Base
	has_many :hobbies
	has_many :locations
end
