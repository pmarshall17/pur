class User < ActiveRecord::Base
	validates_uniqueness_of :email
	validates_presence_of :email, :password_digest
	has_secure_password 
	has_one :person
	after_create :create_person

	def create_account
		Person.create(user_id: self.id)
	end
end
