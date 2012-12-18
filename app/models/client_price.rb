class ClientPrice < ActiveRecord::Base
  attr_accessible :client_id, :price, :visit_type, :id
  
  belongs_to :client
  
  
end
