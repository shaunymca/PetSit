class VisitBlock < ActiveRecord::Base
  attr_accessible :id, :monday, :thursday, :tuesday, :american_end_date, :american_start_date, :visit_price, :visit_type, :wednesday, :friday, :saturday, :sunday, :time_text, :client_id, :client_name, :client_prices_id, :visits_attributes
  attr_accessor :client_prices_id
  belongs_to :client
  has_many :visits
  accepts_nested_attributes_for :visits
  validates_presence_of :client_id
  attr_writer :american_start_date, :american_end_date, :time_text
  before_save :save_american_start_date, :save_american_end_date
  
  after_commit :new_visit

  def client_prices_id
  end
  
  def client_name
    client.try(:id)
  end
  
  def client_name=(last_name)
    self.client = Client.find_by_last_name(id) if last_name.present?
  end
  
  def client_prices_id
  end
  
  def time_text
    @time_text || visit_date_start.try(:strftime, "%I:%M %P")
  end
    
  def american_start_date
    @american_start_date || visit_date_start.try(:strftime, "%m-%d-%Y")
  end
  
  def save_american_start_date
    self.visit_date_start = Chronic.parse("#{american_start_date} at #{time_text}") if @american_start_date.present?
  end
  
  def american_end_date
    @american_end_date || visit_date_end.try(:strftime, "%m-%d-%Y")
  end
  
  def save_american_end_date
    self.visit_date_end = Chronic.parse("#{american_end_date} at #{time_text}") if @american_start_date.present?
  end
  
  private  
    def new_visit  
      day = 0
      date_range = (visit_date_start.to_date..visit_date_end.to_date)
      dates = date_range.count
      while day <= dates
        date = visit_date_start + day.day
        date_end = date + 30.minutes
        day_of_week = date.strftime("%A").downcase
        if (day_of_week == 'sunday' and sunday == true) or (day_of_week == 'monday' and monday == true) or (day_of_week == 'tuesday' and tuesday == true) or (day_of_week == 'wednesday' and wednesday == true) or (day_of_week == 'thursday' and thursday == true) or (day_of_week == 'friday' and friday == true) or (day_of_week == 'saturday' and saturday == true)
          visits.create(:visit_price => visit_price, :visit_type => visit_type, :client_id => client_id, :visit_date => date, :end_time => date_end, :visit_block_id => id)
          day += 1
        else
          day += 1
        end
      end
    end
end