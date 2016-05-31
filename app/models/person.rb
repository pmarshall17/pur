class Person < ActiveRecord::Base
	has_many :hobbies, dependent: :destroy
	has_many :locations, dependent: :destroy
end
