class ClientPrice < ActiveRecord::Base
  attr_accessible :client_id, :price, :visit_type, :id, :default_price_id
  
  belongs_to :client
  belongs_to :default_price
  
  
end
