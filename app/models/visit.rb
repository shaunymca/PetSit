class Visit < ActiveRecord::Base
  attr_accessible :client_id, :user_id, :invoice_id, :visit_date, :visit_price, :visit_type, :visit_block_id, :client_name, :end_time, :american_start_date, :time_text, :end_time_text
  attr_accessor :american_start_date, :time_text, :end_time_text
  belongs_to :client_prices 
  belongs_to :visit_block
  belongs_to :client
  belongs_to :invoice
  belongs_to :user
  belongs_to :account
  
  def start_time
    self.visit_date
  end
  
  scope :before, lambda {|end_time| {:conditions => ["end_time < ?", Visit.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["visit_date > ?", Visit.format_date(start_time)] }}
  
  def visit_block_id
  end
  
  def client_name
    self.client.first_name
  end
  
  def time_text
    @time_text || visit_date.try(:strftime, "%I:%M %P")
  end
  
  def end_time_text
    @end_time_text || end_time.try(:strftime, "%I:%M %P")
  end
    
  def american_start_date
    @american_start_date || visit_date.try(:strftime, "%m-%d-%Y")
  end
  
  def save_american_start_date
    self.visit_date = Chronic.parse("#{american_start_date} at #{time_text}") if @american_start_date.present?
  end
  
  def future_visit
    if Chronic.parse("#{self.visit_date}") >= Chronic.parse("this morning at 00:00")
      true
    else
      false
    end
  end
  
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.client.full_name + " -\n" + self.visit_type,
      :description => self.visit_type || "",
      :start => self.visit_date,
      :end => self.end_time,
      :allDay => false,
      :recurring => false,
      :url => Rails.application.routes.url_helpers.visit_path(id)
    }
    
  end
  
  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end
  
end
