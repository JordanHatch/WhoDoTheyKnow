class PeopleController < ApplicationController
  def index 
    @people = Person.all                                                                        
  end

  def show 
    @person = Person.find_by_id(params[:id])
    
    unless @person.present?
      flash[:error] = 'Person does not exist yet.'
      redirect_to root_url                      
    end
  end        
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(params[:person])
  
    if @person.save?
      redirect_to person_url(@person)
    else
      render :action => :new
    end
  end

end
