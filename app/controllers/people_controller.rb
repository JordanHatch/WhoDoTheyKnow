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

end
