class Invoice < ActiveRecord::Base
  attr_accessible :client_id, :due_date, :paid, :user_id, :visit_id
  has_many :visits
  belongs_to :user
  belongs_to :client
  
  after_create :update_visits
  
  def start_date
  end
  
  def end_date
  end
  
  
  def update_visits
    clients.visits.each do |v|
      if self.start_time >= invoice.start_date && self.start_date < invoice.end_date
        v.invoice_id = self.id
      end
    end
  end
end
