class PeopleController < ApplicationController
  def index                                                                         
  end

  def show 
    @person = Person.find_by_id_and_friendly_url(params[:id], params[:friendly_url])
    
    unless @person.present?
      flash[:error] = 'Person does not exist yet.'
      redirect_to root_url                      
    end
  end

end
