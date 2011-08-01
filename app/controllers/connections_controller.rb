class ConnectionsController < ApplicationController 
  before_filter :get_person
  before_filter :get_connection, :only => [:edit, :update]
  
  def new
    @connection = @person.connections_to.build
  end                           
  
  def create
    @connection = @person.connections_to.build(params[:connection])
    
    if @connection.save              
      flash[:notice] = 'This connection has been added'
      redirect_to @connection.person1                 
    else
      render :action => :new
    end
  end 
  
  def edit

  end

  def update
    if @connection.update_parameters(params[:connection])
      flash[:notice] = 'This connection has been added'
      redirect_to @connection.person1
    end
  end
  
  def get_connection
    @connection = @person.connections_to.find(params[:id])
    
    unless @connection.present?
      flash[:error] = 'Could not find the connection.'
      redirect_to root_url                       
    end  
  end
  
  def get_person   
    @people = Person.all
    
    @person = Person.find_by_id(params[:person_id])
    unless @person.present?
      flash[:error] = 'Could not find the person.'
      redirect_to root_url                       
    end
  end

end
