class Person < ActiveRecord::Base
	belongs_to :user
	has_one :hobby, dependent: :destroy
	has_one :location, dependent: :destroy

end
