class Person < ActiveRecord::Base
	# validates_uniqueness_of :email
	# validates_presence_of :email, :password_digest
	# has_secure_password 
	has_one :hobby, dependent: :destroy
	has_one :location, dependent: :destroy
	# has_one :account
	# after_create :create_account
end
