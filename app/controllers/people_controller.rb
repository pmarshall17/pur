class PeopleController < ApplicationController
  before_action :person, only:[:show, :edit, :destroy, :update]
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
  	@person = Person.new(person_params)
    if @person.save
      # flash[:success] = "#{person.name}, you have taken your first step toward love!"
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def show
  end
  

  def destroy
  	# person = @person
    @person.destroy
    # flash[:success] = "Your profile has now been deleted #{person.name}"
    redirect_to people_path
  end

  def update
  	 if @person.update(person_params)
      # flash[:success] = "Your profile has now been updated!"
      redirect_to person_path(@person)
    else
      render :edit
    end
 	end
	private
		def person_params
			params.require(:person).permit(:name, :age)
		end

		def person
			@person = Person.find(params[:id])
		end
end
