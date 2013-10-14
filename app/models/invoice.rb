class Invoice < ActiveRecord::Base
  resourcify
  attr_accessible :client_id, :due_date, :paid, :account_id, :visit_id, :start_date, :end_date, :american_start_date, :american_end_date, :american_due_date, :visits_attributes, :client_attributes
  has_many :visits
  belongs_to :account
  belongs_to :client
  accepts_nested_attributes_for :visits, :client
  validates_presence_of :client_id, :american_start_date, :american_end_date
  attr_writer :american_start_date, :american_end_date, :american_due_date
  before_save :save_american_start_date, :save_american_end_date, :save_american_due_date
  after_create :update_visits
  
  def client_name
    self.client.full_name
  end
  
  def american_start_date
    @american_start_date || start_date.try(:strftime, "%m-%d-%Y")
  end
  
  def save_american_start_date
    self.start_date = Chronic.parse("#{american_start_date}") if @american_start_date.present?
  end
  
  def american_end_date
    @american_end_date || end_date.try(:strftime, "%m-%d-%Y")
  end
  
  def save_american_end_date
    self.end_date = Chronic.parse("#{american_end_date}") if @american_end_date.present?
  end  

  
  def american_due_date
    @american_due_date || due_date.try(:strftime, "%m-%d-%Y")
  end
  
  def save_american_due_date
    self.due_date = Chronic.parse("#{american_due_date}") if @american_due_date.present?
  end
  
  #Searches for invoices between the start and end range. Gives the visits the invoice_id.
  def update_visits
    self.client.visits.each do |v|
      if self.start_date <= v.visit_date && self.end_date >= v.visit_date
        v.invoice_id = self.id
        v.save
      end
    end
  end
  
  def total_price
    # convert to array so it doesn't try to do sum on database directly
    visits.to_a.sum(&:visit_price)
  end
  
  def paid_text
    if self.paid == true
      "Paid"
    else
      "Unpaid"
    end
  end
  
  def company_name
    account.company_name
  end
  
  
end
