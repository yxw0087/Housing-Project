class Request < ActiveRecord::Base
  before_save {self.clid = clid.downcase}
  before_create {:create_activation_digest}
  validates :clid, length: {maximum: 7, minimum: 7}, presence: true, uniqueness: true
  validates :room, length: {maximum: 4, minimum: 3}, presence: true
  validates :building, presence: true
  
  def create_activation_digest 
    
  end
  
  
end
