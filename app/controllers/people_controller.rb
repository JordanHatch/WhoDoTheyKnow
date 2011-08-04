class PeopleController < ApplicationController   
  before_filter :get_person, :only => [:show, :edit, :update] 
  before_filter :get_companies
  
  def index 
    @people = Person.all :order => 'connections_count DESC'                       
    
    @government = Person.where("department = ?", 'government').order('name ASC')
    @media = Person.where('department = ? and connections_count > ?', 'media', 0).order('name ASC')                                                                   
  end

  def show 
    @start_date = Date.civil(2010,5,1).to_time
    @end_date = Date.civil(2011,6,1).to_time
    
  end        
  
  def new
    @person = Person.new
  end
  
  def create
    @person = Person.new(params[:person])
  
    if @person.save
      redirect_to person_url(@person)
    else
      render :action => :new
    end
  end
  
  def edit
  end
  
  def update
    if @person.update_attributes(params[:person])
      redirect_to person_url(@person)
    else
      render :action => :edit
    end
  end
  
  private
    def get_person
      @person = Person.find_by_id(params[:id])

      unless @person.present?
        flash[:error] = 'Person does not exist yet.'
        redirect_to root_url                      
      end
    end        
    
    def get_companies
      @companies = Company.all
    end

end
