class PeopleController < ApplicationController
  before_action :person, only:[:edit, :destroy, :update]
  # $pur_profiles = []

  def index
    @people = Person.all
    if params[:search]
      @people = Person.search(params[:search]).order("created_at DESC")
    else
      @people = Person.all.order('created_at DESC')
    end
  end

  def new
  	@person = Person.new
  end

  def edit
  end

  def create
  	@person = current_user.create_person(person_params)
    if @person.save
      # session[:person_id] = @person.id
      # redirect_to accounts_show_path
      # $pur_profiles << @person
      # flash[:success] = "#{person.name}, you have taken your first step toward love!"
      redirect_to person_path(@person)
    else
      render :new
    end
  end

  def show
    @person = current_user.person
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
			params.require(:person).permit(:name, :age, :user_id)
		end

		def person
			@person = Person.find(params[:id])
		end
end