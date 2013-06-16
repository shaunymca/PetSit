class Visit < ActiveRecord::Base
  attr_accessible :client_id, :invoice_id, :visit_date, :visit_price, :visit_type, :visit_block_id
  
  belongs_to :visit_block
  
  def visit_block_id
  end
  
  def future_visit
    if Chronic.parse("#{self.visit_date}") >= Chronic.parse("this morning at 00:00")
      true
    else
      false
    end
  end
  
end
