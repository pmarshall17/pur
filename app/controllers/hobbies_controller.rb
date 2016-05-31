class HobbiesController < ApplicationController
  before_action :person
  before_action :hobby, only: [:show, :edit, :update, :destroy]

  def index
  	@hobbies = @person.hobbies
  end

  def show
  end
  
  def new
    @hobby = Hobby.new
  end
  
  def create
	  @hobby = @person.hobbies.new(hobby_params)
	  if @hobby.save
	    # flash[:success] = "hobby with name #{@hobby.name} created!"
	    redirect_to person_hobby_path(@person, @hobby)
	  else
	    render :new
	  end
  end

  def update
    @person = @person.hobbies.find(params[:id])
    if @hobby.update(hobby_params)
      # flash[:success] = "hobby with name: #{@hobby.name} updated!"
      redirect_to person_hobby_path(@person, @hobby)
    else
      render :edit
    end
  end

  def edit
  end

 

  def destroy  
  	# hobby_name = @hobby.name
  	@hobby.destroy
  	redirect_to person_hobbies_path(@person)
  end

  private
  	def hobby_params
  			params.require(:hobby).permit(:music, :tv, :activities)
  	end

   


    def hobby
      @hobby = Hobby.find_by_id(params[:id])
    end

    def person
      @person = Person.find(params[:person_id])
    end
end
