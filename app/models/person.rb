class Person < ActiveRecord::Base   
  
  belongs_to :company                        
                                               
  has_many :connections_to, :class_name => 'Connection', :foreign_key => 'person1_id'
  has_many :connections_from, :class_name => 'Connection', :foreign_key => 'person2_id'
  
  has_many :linked_people_to, :through => :connections_to, :source => :person2
  has_many :linked_people_from, :through => :connections_from, :source => :person1
                                                                                                                         
  before_create :create_friendly_url!
                      
  # merge relationships
  
  def connections
    connections_to + connections_from
  end
  
  def linked_people
    linked_people_to + linked_people_from
  end

  # friendly url stuff

  def to_param
    "#{self.id}-#{self.friendly_url}"
  end                                               
  
  def create_friendly_url!
    self.friendly_url = self.name.parameterize
  end
  
end
