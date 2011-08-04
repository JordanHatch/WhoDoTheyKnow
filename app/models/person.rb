class Person < ActiveRecord::Base   
  
  belongs_to :company                        
                                               
  has_many :connections_to, :class_name => 'Connection', :foreign_key => 'person1_id'
  has_many :connections_from, :class_name => 'Connection', :foreign_key => 'person2_id'
  
  has_many :linked_people_to, :through => :connections_to, :source => :person2
  has_many :linked_people_from, :through => :connections_from, :source => :person1
                                                                                                                         
  before_create :create_friendly_url!                    
  
  validates_presence_of :name, :department
  validates_associated :company
  validates_length_of :name, :minimum => 4, :maximum => 50
                      
  # merge relationships
  
  def connections
    (connections_to + connections_from).sort_by(&:date)
  end    
  
  def connections_by_month
    connections_to.group_by(&:month).sort
  end
  
  def linked_people
    (linked_people_to + linked_people_from).inject([]) { |result,h| result << h unless result.include?(h); result }
  end   
  
  # tag cloud
  
  def self.to_histogram
    Person.all.inject({}){|set, t| set[t.name] = t.connections_count; set }
  end

  # friendly url stuff

  def to_param
    "#{self.id}-#{self.friendly_url}"
  end                                               
  
  def create_friendly_url!
    self.friendly_url = self.name.parameterize
  end
  
end
