class LocationsController < ApplicationController
  
  before_action :person
  before_action :location, only: [:show, :edit, :update, :destroy]

  def index
    @locations = @person.locations
  end

  def show
  end

  def new
    @location = Location.new 
  end

  def create
    @location = @person.locations.new(location_params)
    if @location.save
      redirect_to person_location_path(@person, @location)
    else
      render :new
    end
  end
  
  def update
    @person = @person.locations.find(params[:id])
    if @location.update(location_params)
      redirect_to person_location_path(@person, @location)
    else
      render :edit
    end
  end

  def edit
  end
  
  def destroy
    @location.destroy
    redirect_to person_locations_path(@person)
  end



private

  def location_params
    params.require(:location).permit(:city, :state)
  end
  
  def location
    @location = Location.find_by_id(params[:id])
  end
  
  def person
    @person = Person.find(params[:person_id])
  end
end
