class Person < ActiveRecord::Base   
  
  belongs_to :company                        
                          
  def to_param
    "#{self.id}-#{self.friendly_url}"
  end
     
  before_create :create_friendly_url!
  
  def create_friendly_url!
    self.friendly_url = self.name.parameterize
  end
  
end
