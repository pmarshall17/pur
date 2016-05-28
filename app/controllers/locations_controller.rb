class LocationController < ApplicationController
  before_action :person
  # before_action :hobbies
  before_action :location, only: [:show, :edit, :destroy, :update, :new, :create]

	def index
		@locations = @person.locations
  end

  def show
  end

  def new
  	@location = Location.new
  end

  def edit
  end

  def destroy
  	@location.destroy
    # flash[:success] = "location with name #{name} destroyed!"
    redirect_to person_locations_path(@person)
  end

  def create
      @location = @person.locations.new(location_params)
    if @location.save
      # flash[:success] = "location with name #{@location.name} created!"
      redirect_to person_location_path(@person, @location)
    else
      render :new
    end

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
