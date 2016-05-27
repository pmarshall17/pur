class PeopleController < ApplicationController
  before_action :person, only:[:show, :edit, ]
  # before_action :
  # before_action :


  def index
  	@person = Person.all
  end

  def new
  	@person = Person.new
  end

  def edit
  end

  def create
  	@city = City.new(city_params)
    if @city.save
      flash[:success] = "City with name: #{@city.name} created!"
      redirect_to city_path(@city)
    else
      render :new
    end
  end

  def show
  end
  

  def destroy
  	person_name = @person.name
    @person.destroy
    flash[:success] = "Your profile has now been deleted #{person.name}"
    redirect_to person_path
  end

  def update
  	 if @person.update(person_params)
      flash[:success] = "Your profile has now been updated!"
      redirect_to person_path(@person)
    else
      render :edit
    end
 	end
	private
		def person_params
			params.require(:person).permit(:person, :name, :age)
		end

		def person
			@person = Person.find(params[:id])
		end
end
