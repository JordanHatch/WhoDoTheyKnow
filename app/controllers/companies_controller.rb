class CompaniesController < ApplicationController
  before_filter :get_company, :only => [:edit, :update]
  
  def new
    @company = Company.new
  end                     
  
  def create
    @company = Company.new params[:company]
    
    if @company.save
      redirect_to new_company_url
    else
      render :action => :new
    end
  end

  def edit                              
  end                                   
  
  def update
    if @company.update_attributes(params[:company])
      redirect_to edit_company_url(@company)
    else
      render :action => :edit
    end
  end
  
  private
    def get_company
      @company = Company.find params[:id]
    end

end
