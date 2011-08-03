module PeopleHelper    
  
  def department_for(person)   
    if person.department?
             
      case person.department
      when 'government'
        department = 'Government'
      when 'media'
        department = 'Media'
      when 'police'
        department = 'Police'
      when 'judiciary'
        department = 'Judiciary' 
      end
    
      "<span class='badge #{department.downcase}'>#{department}</span>".html_safe
    
    end
  end      
  
  def people_cloud
    
    
  end
  
end
