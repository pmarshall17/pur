class Hobby < ActiveRecord::Base
	belongs_to :person
  # validates_presence_of :name, :food_type
  # validates :cost_rating, inclusion: {in: RATINGS}
  # validates :open, :alcohol, :take_out, inclusion: {in: [true, false]}

  # class method on active record model is called a scope
  # Restaurant.all.by_name
  # def self.by_name
  #   order(:name)
  # end

  # def self.ratings
  #   RATINGS
  # end

  # # Restaurant.all.by_cost
  # def self.by_cost
  #   order(:cost_rating)
  # end

  # Instance Method
  # Restaurant.first.status
  # def status
  #   if self.open
  #     "The Restaurant: #{self.name} is open for business!"
  #   else
  #     "The Restaurant: #{self.name} opens very soon!"
  #   end
  # end
end
