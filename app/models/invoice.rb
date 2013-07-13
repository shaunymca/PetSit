class Invoice < ActiveRecord::Base
  attr_accessible :client_id, :due_date, :paid, :user_id, :visit_id
  has_many :visits
  belongs_to :user
  belongs_to :client
  
  def start_date
  end
  
  def end_date
  end
  
  
  
end
