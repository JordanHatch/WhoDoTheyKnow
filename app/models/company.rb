class Company < ActiveRecord::Base
  
  has_many :people
  
  before_create :create_friendly_url! 
  
  # friendly url stuff

  def to_param
    "#{self.id}-#{self.friendly_url}"
  end                                               
  
  def create_friendly_url!
    self.friendly_url = self.name.parameterize
  end
  
end
