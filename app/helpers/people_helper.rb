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
  
  def heatmap(histogram={})
    html = %{<div class="heatmap">}
    _max = histogram.map{|k,v| histogram[k]}.max * 2
    histogram.keys.sort{|a,b| histogram[a] <=> histogram[b]}.reverse.each do |k|
      next if histogram[k] < 1
      _size = (((histogram[k] / histogram.map{|key,val| histogram[key]}.sum.to_f) * 100) + 5).to_i
      _heat = sprintf("%02x" % (255 - (_size * 25)))
      html << %{
        <div class="heatmap_element" style="color: ##{_heat}#{_heat}#{_heat}; font-size: #{_size}px; height: #{_max}px;">#{k}</div>
      }
    end
    html << %{<br style="clear: both;" /></div>}
  end
  
end
