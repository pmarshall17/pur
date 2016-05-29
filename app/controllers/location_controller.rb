class LocationController < ApplicationController
  before_action :person
  before_action :location, only: [:edit, :new]

  def index
  	@locations = @person.location
  end

  def show
  end

  def edit
  end

  def new
	 @location = Location.new
  end

  private
	def location_params
    params.require(:location).permit(:city, :state)
  end

  def location
    @location = @person.location.find(params[:id])
  end

  def person
    @person = Person.find(params[:person_id])
  end

end
