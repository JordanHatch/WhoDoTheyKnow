module PeopleHelper    
  
  def department_for(person, mode = 'full')   
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
                                      
      department_class = department.downcase
      department_title = department
      if mode == 'mini'               
        department_show = department[0,1]
      else
        department_show = department
      end
    
      "<span class='badge badge_#{mode} #{department_class}' title='#{department_title}'>#{department_show}</span>".html_safe
    
    end
  end      
  
  def people_cloud
    
    
  end
  
end
