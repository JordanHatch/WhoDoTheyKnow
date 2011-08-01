class Connection < ActiveRecord::Base      
  
  belongs_to :person1, :class_name => 'Person'
  belongs_to :person2, :class_name => 'Person'
                                 
  def person(person_to_exclude)
    if person1 == person_to_exclude
      person2
    else
      person1
    end
  end
  
end
