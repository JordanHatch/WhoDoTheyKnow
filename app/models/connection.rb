class Connection < ActiveRecord::Base      
  
  belongs_to :person1, :class_name => 'Person'
  belongs_to :person2, :class_name => 'Person'
  
  validates_presence_of :person1, :person2
     
  after_create :update_counters
  after_destroy :update_counters
                                 
  def person(person_to_exclude)
    if person1 == person_to_exclude
      person2
    else
      person1
    end
  end       
  
  def month
    self.date.strftime('%m-%Y')
  end
  
  def update_counters
    person1.update_attributes :connections_count => person1.connections.count
    person2.update_attributes :connections_count => person2.connections.count 
  end
  
end
