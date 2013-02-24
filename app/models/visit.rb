class Visit < ActiveRecord::Base
  attr_accessible :client_id, :invoice_id, :visit_date, :visit_price, :visit_type
  
  belongs_to :visit_block
  
end
