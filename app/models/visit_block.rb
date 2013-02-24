class VisitBlock < ActiveRecord::Base
  attr_accessible :monday, :thursday, :tuesday, :visit_date_end, :visit_date_start, :visit_price, :visit_type, :wednesday, :friday, :saturday, :sunday, :visit_time, :client_id, :client_prices_id

  belongs_to :client
  has_many :visits
  

  
  def client_prices_id
  end
  
  def client_name
    client.try(:last_name)
  end
  
  def client_name=(last_name)
    self.client = Client.find_by_last_name(last_name) if last_name.present?
  end
  
end
