class Visit < ActiveRecord::Base
  attr_accessible :client_id, :invoice_id, :visit_date, :visit_price, :visit_type, :visit_block_id
  
  belongs_to :visit_block
  
  def visit_block_id
  end
  
end
